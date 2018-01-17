require 'yaml'
require 'logger'
require 'tty-prompt'
require 'tty-screen'
require 'mixlib/shellout'
require 'colorize'
require 'word_wrap'
require 'word_wrap/core_ext'
require_relative 'typing_speed'

# [:black, :light_black, :red, :light_red, :green, :light_green, :yellow, :light_yellow, :blue, :light_blue, :magenta, :light_magenta, :cyan, :light_cyan, :white, :light_white, :default]

$logger = Logger.new(STDOUT)
$logger.level = Logger::WARN

class GameState
  def initialize(state_hash)
    @state = state_hash
  end

  def advance!(command)
    @state['commands'] += [ command, Time.now ]
    if command == 'exit'
      @exit = true
    elsif options.keys.include?(command)

      description = options[command]['description'].colorize(:white).fit(TTY::Screen.width)
      speed = Dutchman::GhostWriter::TypingSpeed.new(:very_fast,true)

      description.chars.each do |char|
        print char
        sleep(speed.delay)
      end

      if current_event_name = options[command]['event']
        fire_event events[current_event_name]
      else
        fail 'no event'
      end
    end
  end

  def options
    current_scene['options']
  end

  def advance_scene(new_scene_name)
    $logger.debug "Advancing scene to #{new_scene_name}"
    if new_scene_name.split('.')[1].nil?
      new_scene_name += ".#{current_act}"
    end
    @state['current_scene'] = new_scene_name
  end

  def current_scene_setting
    @state['current_scene']
  end

  def current_scene_name
    current_scene_setting.split('.')[0]
  end

  def current_act
    current_scene_setting.split('.')[1]
  end

  def current_scene
    scene(current_scene_setting)
  end

  def scene(scene_address)
    name, act = scene_address.split('.')
    act ||= current_act
    YAML.load(File.read("#{act ? "#{act}/" : "" }scenes/#{name}.yaml"))
  end

  def description
    current_scene['description']
  end

  def picture
    picture_path = "#{current_act ? "#{current_act}/" : "" }art/#{current_scene_name}.txt"

    File.read(picture_path) if File.exist?(picture_path)
  end

  def menu
    current_scene['menu']
  end

  def events
    current_scene['events'] || {}
  end

  def fire_event(event)
    return unless event

    # condition = Condition.new(event['condition'])
    # condition.check! if condition.un_met?
    # advance_scene(event['transition']) if condition.met
    advance_scene(event['transition']) if event['transition']
    if event['game'] && event['game'] == 'the-end'
      @exit = true
      # TODO: This is not good that I hard-coded this story into here.
      @state['current_scene'] = 'change-careers.select-level'
    end
  end

  def exit?
    @exit
  end

  def complete?
    @state['current_scene'] == 'complete'
  end

  def exit!
    save!
  end

  def save!
    $logger.debug "Saving Game State"
    File.write('game_state.yml',@state.to_yaml)
  end
end


def process_world(state) ; end

def load_current_game_state
  game_state_filename = '.game_state.yml'
  game_state_filename = 'game_state.yml' if File.exist?('game_state.yml')
  @state = GameState.new(YAML.load(File.read(game_state_filename)))
end

def state
  @state
end

def start_game
  while not state.exit?
    # Fire the enter scene events
    fire_event state.events['on_enter']

    # Format and display the description
    layout(state)

    # Display the choices and ask for a commdn
    command = display_menu(state)

    # Advance the state based on the command given
    state.advance!(command)

    # Perform any world processing with the new state
    # process_world(state)
  end
  exit_game(state)
end

def layout(state)

  writer = Writer.new # Kernel for puts/print

  data = state.current_scene
  description_file = "#{state.current_act}/scenes/#{state.current_scene_name}.desc"

  description = File.exist?(description_file) ? File.read(description_file) : state.description
  scene = Scene.new(data,description,state.picture)

  scene.describe(writer)
  writer.write

end

class Condition
  def initialize(check)
    @check = check
  end

  attr_reader :met, :check

  def un_met?
    !met
  end

  def check!
    if un_met?
      if check.nil?
        @met = true
      else
        $logger.debug "Checking Event Condition: #{check}"
        result = Mixlib::ShellOut.new(check).run_command
        $logger.debug "Event Result: #{result.exitstatus}"
        @met = result.exitstatus == 0
      end
    end
  end
end

def fire_event(event)
  return unless event

  condition = Condition.new(event['condition'])

  condition.check! if condition.un_met?
  state.advance_scene(event['transition']) if condition.met
end

def exit_game(state)
  state.exit!
  exit
end

def display_menu(state)
  prompt = TTY::Prompt.new
  prompt.select('Choose:'.colorize(:light_yellow)) do |menu|
    state.menu.each do |item|
      menu.choice item['name'], item['value']
    end
  end
end

# Allow the game engine to use additional commands.

command = ARGV[0]

class Scene
  def initialize(data, description, art)
    @data = data
    @description = description
    @art = art
  end

  attr_reader :description, :art

  def describe(writer)
    writer.new_stroke(:art, :default, :default)
    writer.add(art)

    description.lines.each do |line|
      if matches = line.match(/\[(?<metadata>[^\]]+)\]/)
        stroke, speed, color = matches[:metadata].split(',').map { |data| data.strip }
        stroke = (stroke || :default).to_sym
        speed = (speed || :default).to_sym
        color = (color || :default).to_sym
        writer.new_stroke(stroke, color, speed)
      else
        writer.add(line.rstrip)
      end
    end
  end
end

class Writer
  def initialize
    @out = Kernel
  end

  attr_reader :out

  def strokes
    @strokes ||= []
  end

  def new_stroke(name, color, speed)
    strokes << all_strokes[name].new(speed, color)
  end

  def all_strokes
    @all_strokes ||= { typed: TypedStroke,
      default: DefaultStroke,
      speech: SpeechStroke,
      art: ArtStroke }
  end

  def current_stroke
    strokes.last
  end

  def add(text)
    current_stroke.add(text)
  end

  def write
    strokes.each do |stroke|
      stroke.write(out)
      out.puts
    end
  end
end

class Stroke
  def initialize(speed, color)
    @speed = speed
    @color = color
    @text = ""
  end

  attr_reader :speed, :color, :text

  def add(text)
    @text << text
  end

  def write(out)
    raise 'Unable to write; Subclass Stroke!'
  end
end

class ArtStroke < Stroke
  def write(out)
    out.puts text.colorize(color)
  end
end

class DefaultStroke < Stroke
  def write(out)
    out.puts text.colorize(color).fit(TTY::Screen.width)
  end
end

class TypedStroke < Stroke
  def write(out)
    formatted_text = text.colorize(color).fit(TTY::Screen.width)
    typing_speed = Dutchman::GhostWriter::TypingSpeed.new(speed,true)

    formatted_text.chars.each do |char|
      out.print char
      sleep(typing_speed.delay)
    end
  end
end

class SpeechStroke < TypedStroke
  # def write(out)
  #   if
  #   # split for heads for text
  #   # start of speech "
  #   # End of sentences or other punctation
  #   # Elipses
  #
  # end
end


[:black, :light_black, :red, :light_red, :green, :light_green, :yellow, :light_yellow, :blue, :light_blue, :magenta, :light_magenta, :cyan, :light_cyan, :white, :light_white, :default].each do |color|

  puts "#{color} The quick brown fox jumped over the lazy dog.".colorize(color)
end

if command.nil? || command == 'run'
  load_current_game_state
  start_game
elsif command == 'check'
  load_current_game_state
  if state.complete?
    exit 0
  else
    exit 1
  end
end
