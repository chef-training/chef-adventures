require 'lib/stroke'

class ArtStroke < Stroke
  def write(out)
    out.puts text.colorize(color)
  end
end
