class Stroke
  def initialize(speed, color)
    @speed = speed
    @color = color
    @text = ""
  end

  attr_reader :speed, :color

  def text
    @text.gsub("\n\n","\n")
  end

  def add(text)
    @text << text
  end

  def write(out)
    raise 'Unable to write; Subclass Stroke!'
  end

  def sleep(param)
    Kernel.sleep(param)
  end
end
