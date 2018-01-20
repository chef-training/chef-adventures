require 'yaml'
require 'logger'
require 'tty-prompt'
require 'tty-screen'
require 'mixlib/shellout'
require 'colorize'
require 'word_wrap'
require 'word_wrap/core_ext'

$LOAD_PATH << "."

require 'lib/typing_speed'
require 'lib/game_state'
require 'lib/writer'


# Allow the game engine to use additional commands.

command = ARGV[0]

# [:black, :light_black, :red, :light_red, :green, :light_green, :yellow, :light_yellow, :blue, :light_blue, :magenta, :light_magenta, :cyan, :light_cyan, :white, :light_white, :default].each do |color|
#
#   puts "#{color} The quick brown fox jumped over the lazy dog.".colorize(color)
# end

if command.nil? || command == 'run'
  game_state = GameState.new
  game_state.start!('woodpecker-comes-home.woodpecker-and-the-oak')
elsif command == 'check'
  # puts "Checking on completed state!"

  game_state = GameState.new

  if File.exist?('game_state.yml')
    data = YAML.load(File.read('game_state.yml'))
    game_state.start!(data[:current_scene])
  end

  # load_current_game_state
  # if state.complete?
  #   exit 0
  # else
  exit 1
  # end
end
