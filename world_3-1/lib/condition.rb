require 'lib/scene_loader'
require 'mixlib/shellout'

class Condition
  def initialize(name,data = {},&block)
    @name = name
    @data = data
    @scene_description = block
  end

  attr_reader :name, :data

  def transition
    @transition_scene
  end

  def command
    "inspec exec inspec/#{name}.rb"
  end

  def create_scene(state)
    condition_scene = SceneLoader.load_from_scene_block(&@scene_description)
    condition_scene.state = state
    condition_scene
  end

  # GameState
  def fire(state)
    result = Mixlib::ShellOut.new(command).run_command
    if result.exitstatus == 0
      state.start create_scene(state)
    end
  end
end
