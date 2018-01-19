require 'lib/stroke'
require 'lib/typing_speed'

class SpeechStroke < Stroke

  def expression_terminator
    "\""
  end

  def character_pause
    0.2
  end

  def sentence_pause
    0.8
  end

  def for_parts_of_speech
    /(?<character>[^#{expression_terminator}]+)(?:#{expression_terminator}(?<expression>[^#{expression_terminator}]+)#{expression_terminator})?/
  end


  def write(out)
    typing_speed = Dutchman::GhostWriter::TypingSpeed.new(speed,true)

    fit_text = text.fit(TTY::Screen.width)

    fit_text.scan(for_parts_of_speech).each do |character, expression|
      out.print character
      sleep character_pause

      next if expression.nil?

      formatted_text = "#{expression_terminator}#{expression}#{expression_terminator}".colorize(color)

      sentences = formatted_text.split('.')

      sentences[0..-2].each do |sentence|
        sentence.chars.each do |char|
          out.print char
          sleep(typing_speed.delay)
        end
        out.print('.')
        sleep sentence_pause
      end

      sentences[-1].chars.each do |char|
        out.print char
        sleep(typing_speed.delay)
      end

    end

  end
end
