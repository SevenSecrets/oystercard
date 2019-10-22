require_relative 'oystercard'
require_relative 'station'

class Journey

  attr_reader :last_journey

  def initialize(entry_station = "Aldgate East")
    @last_journey = Hash.new
    @entry_station = entry_station
    @penalty_fare = 6
  end

  def journey_history(station)
    @last_journey = {
      :destination => station,
      :origin => @entry_station
    }
  end

  def fare(min_fare)
    return min_fare unless @last_journey[:origin] == nil || @last_journey[:destination] == nil
    @penalty_fare
  end
end
