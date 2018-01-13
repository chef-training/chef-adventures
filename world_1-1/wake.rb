require 'yaml'
require 'logger'
require 'tty-prompt'
require 'tty-screen'

$logger = Logger.new(STDOUT)
$logger.level = Logger::WARN

class GameState
  def initialize(state_hash)
    @state = state_hash
  end

  def advance!(command)
    @state['commands'] += [ command, Time.now ]

    if menu.include?(command)
      puts options[command]['description']

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

  def menu
    current_scene['menu']
  end

  def exit?
    @exit
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
    prompt = TTY::Prompt.new

    size = TTY::Screen.width - 5

    prompt.say ((state.description.length + size - 1)/ size).times.map { |i| state.description[i * size, size] }.join("\n")

    command = display_menu(state)

    state.advance!(command)
    process_world(state)
  end
  exit_game(state)
end

def exit_game(state)
  state.exit!
  exit
end

def display_menu(state)
  prompt = TTY::Prompt.new
  prompt.select('Choose:',state.menu)
end

load_current_game_state
start_game
