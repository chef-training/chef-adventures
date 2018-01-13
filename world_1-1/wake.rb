require 'yaml'
require 'logger'
require 'tty-prompt'
require 'tty-screen'
require 'mixlib/shellout'
require 'colorize'
require 'word_wrap'
require 'word_wrap/core_ext'

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
      puts options[command]['description'].colorize(:white)
      puts "\n"

      if options[command]['transition'] == 'exit'
        @exit = true
      elsif options[command]['transition']
        advance_scene options[command]['transition']
      end
    end
  end

  def options
    current_scene['options']
  end

  def advance_scene(new_scene_name)
    $logger.debug "Advancing scene to #{new_scene_name}"
    @state['current_scene'] = new_scene_name
  end

  def current_scene
    scene @state['current_scene']
  end

  def scene(name)
    @state['scenes'][name]
  end

  def description
    current_scene['description']
  end

  def picture
    File.read(current_scene['picture']) if current_scene['picture']
  end

  def menu
    current_scene['menu']
  end

  def events
    current_scene['events'] || {}
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

def process_world(state)
  #
end

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

    fire_event state.events['enter']

    # Format and display the description

    prompt = TTY::Prompt.new
    prompt.say layout(state)

    fire_event state.events['after_enter']

    next if state.exit?

    # Display the choices and ask for a commdn

    command = display_menu(state)

    # Advance the state based on the command given

    state.advance!(command)

    # Perform any world processing with the new state

    process_world(state)
  end
  exit_game(state)
end

def layout(scene)
  output = ""
  output += state.picture.to_s
  output += state.description.colorize(:white).fit(TTY::Screen.width)
end

def fire_event(event)
  return unless event
  condition = event['condition']
  $logger.debug "Checking Event [#{event}] Condition: #{condition}"
  result = Mixlib::ShellOut.new(condition).run_command
  $logger.debug "Event Result: #{result.exitstatus}"
  if result.exitstatus == 0
    state.advance!(event['transition'])
  end
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
