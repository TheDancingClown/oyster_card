class Oystercard
  attr_reader :balance, :entry_station

  LIMIT = 90
  MINIMUM_BALANCE = 1
  MINIMUM_CHARGE = 1

  def initialize(balance = 0)
    @balance = balance
    @entry_station = entry_station
  end

  def top_up(amount)
    fail "Card reached the GBP#{LIMIT} limit" if @balance + amount > LIMIT
    @balance += amount
  end
  
  def touch_in(station)
    raise "Minimum amount to travel is £1" if @balance < MINIMUM_BALANCE
    @card_status = true
  end

  def touch_out
    deduct(MINIMUM_CHARGE)
    @card_status = false
  end
  
  def in_journey?
    @card_status
  end

private

  def deduct(amount)
    @balance -= amount
  end

end
