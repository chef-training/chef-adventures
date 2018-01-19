require 'lib/scene_loader'

class Event
  def initialize(name,data = {},&block)
    @name = name
    @data = data
    @scene_description = block
  end

  attr_reader :name, :data

  def create_scene(state)
    event_scene = SceneLoader.load_from_scene_block(&@scene_description)
    event_scene.state = state
    event_scene
  end

  # GameState
  def fire(state)
    state.start create_scene(state)
  end
end
