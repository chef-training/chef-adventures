require 'lib/scene_loader'

class GameState
  def initialize
    @current_scene = nil
  end

  def start!(location)
    transition(location)
  end

  def transition(location)
    puts "Transitioning to #{location}"
    scene = SceneLoader.load_from_location location
    scene.state = self
    start scene
  end

  def start(scene)
    save if @current_scene
    @current_scene = scene
    scene.describe
    # Change to .act and ensure that it's optional.
    scene.choose
  end

  def save
    File.write('game_state.yml',{ current_scene: @current_scene.name }.to_yaml)
  end
end
