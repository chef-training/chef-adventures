class Scene
  def initialize(address)
    @address = address
    @chooser = Chooser.new
    @conditions = []
    @events = []
    @writer = Writer.new
  end

  attr_reader :address

  attr_reader :writer, :chooser, :events, :conditions

  attr_accessor :state, :transition

  def describe
    writer.write
    conditions.each { |condition| condition.fire(state) }
    state.transition(transition) if transition
  end

  def choose
    choice_made = chooser.choose
    fire_event choice_made if choice_made
  end

  def fire_event(name)
    events.find { |event| event.name == name }.fire(state)
  end

  def base_path
    File.dirname address.split('.').reverse.join('/')
  end

  def name
    File.basename address.split('.').reverse.join('/')
  end
end
