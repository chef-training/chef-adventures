require 'lib/stroke'
require 'lib/default_stroke'
require 'lib/typed_stroke'
require 'lib/speech_stroke'
require 'lib/art_stroke'

class Writer
  def initialize
    @out = Kernel
  end

  attr_reader :out

  def strokes
    @strokes ||= []
  end

  def new_stroke(name, speed, color)
    strokes << all_strokes[name].new(speed, color)
  end

  def all_strokes
    @all_strokes ||= { typed: TypedStroke,
      default: DefaultStroke,
      speech: SpeechStroke,
      art: ArtStroke }
  end

  def current_stroke
    strokes.last
  end

  def add(text)
    current_stroke.add(text)
  end

  def write
    strokes.each do |stroke|
      stroke.write(out)
      out.puts
    end
  end
end
