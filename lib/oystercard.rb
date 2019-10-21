class Oystercard

  attr_reader :balance
  attr_reader :max_balance

  def initialize
    @balance = 0
    @max_balance = 90
  end

  def top_up(num)
    fail "Maximum balance of #{@max_balance} exceeded" if @balance + num > @max_balance
    @balance += num
  end

end
