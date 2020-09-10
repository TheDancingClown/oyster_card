require_relative 'journey'

class Oystercard
  attr_reader :balance, :history, :journey, :journey_class

  LIMIT = 90
  MINIMUM_BALANCE = 1
  MINIMUM_CHARGE = 1

  def initialize(balance = 0, journey_class = Journey)
    @balance = balance
    @history = []
    @journey = nil
    @journey_class = journey_class
  end

  def top_up(amount)
    fail "Card reached the GBP#{LIMIT} limit" if @balance + amount > LIMIT
    @balance += amount
  end
  
  def touch_in(entry_station = nil )
    @journey = journey_class.new(entry_station) 
    raise "Minimum amount to travel is £1" if @balance < MINIMUM_BALANCE
  end

  def touch_out(exit_station)
    @history << @journey.finish(exit_station)
    deduct(journey.fare)
    @journey = nil
  end
  
  def in_journey?
    !@journey.nil?
  end

private

  def deduct(amount)
    @balance -= amount
  end
end
