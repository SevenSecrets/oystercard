require_relative 'oystercard'
require_relative 'journey'

class Station

  attr_reader :zone, :name

  def initialize(name = "Aldgate East", zone = 3)
    @name = name
    @zone = zone
  end
end
