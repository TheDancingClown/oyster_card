class Oystercard
  attr_reader :balance

  LIMIT = 90
  MINIMUM_BALANCE = 1

  def initialize(balance = 0)
    @balance = balance
  end

  def top_up(amount)
    fail "Card reached the GBP#{LIMIT} limit" if @balance + amount > LIMIT
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end
  
  def touch_in
    raise "Minimum amount to travel is £1" if @balance < MINIMUM_BALANCE
    @card_status = true
  end

  def touch_out
    @card_status = false
  end
  
  def in_journey?
    @card_status
  end
end
