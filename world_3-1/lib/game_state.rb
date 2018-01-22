require 'lib/scene_loader'

class GameState
  def initialize
    @current_scene = nil
  end

  def start!(location)
    transition(location)
  end

  def transition(location)
    # puts "Transitioning to #{location}"
    scene = SceneLoader.load_from_location location
    scene.state = self
    start scene
  end

  def start(scene)
    @current_scene = scene
    save
    scene.describe
    # Change to .act and ensure that it's optional.
    scene.choose
  end

  def save
    # TODO-refactor: This should be some object to take care of saving scenes
    File.write('game_state.yml',{ current_scene: @current_scene.address }.to_yaml)
  end
end
