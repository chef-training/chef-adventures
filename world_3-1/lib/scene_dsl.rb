require 'lib/scene'
require 'lib/chooser'
require 'lib/event'
require 'lib/condition'

module SceneDSL
  attr_reader :scene

  def writer
    scene.writer
  end

  def chooser
    scene.chooser
  end

  def art(name)
    writer.new_stroke(:art, :default, :default)
    content = File.read("#{scene.base_path}/art/#{name}.txt")
    writer.add(content)
  end

  def write(text, type=:default, speed=:default, color=:default)
    writer.new_stroke(type, speed, color)
    writer.add(text)
  end

  def option(menu,data)
    option = chooser.new_option(menu, data)
  end

  def event(name,data={},&block)
    event = Event.new(name,data,&block)
    scene.events.push event
    event
  end

  def transition(scene_name)
    scene.transition = scene_name
  end

  def condition(name,command,data = {},&block)
    condition = Condition.new(name,command,data,&block)
    scene.conditions.push condition
    condition
  end
end
