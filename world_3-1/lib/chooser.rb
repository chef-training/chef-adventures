class Chooser
  def initialize
    @writer = Writer.new
    @menu = []
  end

  attr_reader :menu

  def new_option(menu, data)
    option = Option.new({ name: menu, value: (data[:id] || generate_id), event: data[:event] })
    @menu.push option
    option
  end

  def generate_id
    Time.now.to_i
  end

  attr_reader :writer

  def choose
    return if menu.empty?

    prompt = TTY::Prompt.new
    result = prompt.select('Choose:'.colorize(:light_yellow)) do |m|
      menu.each { |item| m.choice item.name, item.value }
    end

    menu.find { |item| item.value == result }.event
  end
end

class Option
  def initialize(data)
    @name = data[:name]
    @value = data[:value]
    @event = data[:event]
    @writer = Writer.new
  end

  attr_reader :writer, :name, :value, :event
end
