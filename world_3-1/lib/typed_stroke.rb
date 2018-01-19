require 'lib/stroke'
require 'lib/typing_speed'

class TypedStroke < Stroke
  def write(out)
    formatted_text = text.fit(TTY::Screen.width).colorize(color)
    typing_speed = Dutchman::GhostWriter::TypingSpeed.new(speed,true)

    formatted_text.chars.each do |char|
      out.print char
      sleep(typing_speed.delay)
    end
  end
end
