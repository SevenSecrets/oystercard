require_relative 'station'
require_relative 'journey'

class Oystercard

  attr_reader :balance, :entry_station, :max_balance
  MIN_FARE = 1

  def initialize
    @balance = 0
    @max_balance = 90
    @journey = Journey.new(@entry_station)
  end

  def top_up(num)
    fail "Maximum balance of #{@max_balance} exceeded" if @balance + num > @max_balance
    @balance += num
  end

  def in_journey?
    return true unless @entry_station == nil
  end

  def touch_in(entry_station)
    fail "insufficient funds" if @balance < MIN_FARE
    @entry_station = entry_station
  end

  def touch_out(destination)
    @journey.journey_history(destination)
    fare = @journey.fare(MIN_FARE)
    deduct(fare)
    @entry_station = nil
  end

  private

  def deduct(fare)
    @balance -= fare
  end

end
