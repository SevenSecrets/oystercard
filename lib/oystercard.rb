class Oystercard

  attr_reader :balance
  attr_reader :max_balance
  attr_reader :entry_station
  MIN_FARE = 1

  def initialize
    @balance = 0
    @max_balance = 90
    @travelling = false
  end

  def top_up(num)
    fail "Maximum balance of #{@max_balance} exceeded" if @balance + num > @max_balance
    @balance += num
  end

  def in_journey?
    @travelling
  end

  def touch_in(entry_station)
    fail "insufficient funds" if @balance < MIN_FARE
    @travelling = true
    @entry_station = entry_station
  end

  def touch_out
    @travelling = false
    deduct
  end

  private

  def deduct
    @balance -= 1
  end

end
