require 'lib/stroke'

class DefaultStroke < Stroke
  def write(out)
    out.puts text.colorize(color).fit(TTY::Screen.width)
  end
end
