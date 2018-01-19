require 'lib/scene_dsl'

class DressingRoom
  def initialize(scene)
    @scene = scene
  end

  include SceneDSL
end

class SceneLoader
  def self.load_from_location(location)
    new(Scene.new(location)).load_scene
  end

  def self.load_from_scene_block(&block)
    new.load_scene(&block)
  end

  def load_scene(&block)
    room = DressingRoom.new(@scene)

    if block_given?
      room.instance_exec(&block)
    else
      content = File.read("#{@scene.base_path}/scenes/#{@scene.name}.rb")
      room.instance_eval(content)
    end

    @scene
  end

  def initialize(scene = Scene.new('unknown-address'))
    @scene = scene
  end
end
