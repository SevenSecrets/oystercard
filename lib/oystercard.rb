class Oystercard

  attr_reader :balance
  attr_reader :max_balance

  def initialize
    @balance = 0
    @max_balance = 90
    @travelling = false
  end

  def top_up(num)
    fail "Maximum balance of #{@max_balance} exceeded" if @balance + num > @max_balance
    @balance += num
  end

  def deduct
    @balance -= 1
  end

  def in_journey?
    @travelling
  end

  def touch_in
    @travelling = true
  end

  def touch_out
    @travelling = false
  end

end
