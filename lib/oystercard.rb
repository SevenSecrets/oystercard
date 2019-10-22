class Oystercard

  attr_reader :balance, :entry_station, :max_balance, :last_journey
  MIN_FARE = 1

  def initialize
    @balance = 0
    @max_balance = 90
    @last_journey = Hash.new
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
    @entry_station = nil
    deduct
    journey_history(destination)
  end

  def journey_history(station)
    @last_journey = {
      :destination => station,
      :origin => @entry_station
    }
  end

  private

  def deduct
    @balance -= 1
  end

end
