require 'journey'

class Oystercard
  attr_reader :balance, :entry_station, :exit_station, :list_of_journeys, :journey

  LIMIT = 90
  MINIMUM_BALANCE = 1
  MINIMUM_CHARGE = 1

  def initialize(balance = 0)
    @balance = balance
    @entry_station = entry_station
    @exit_station = exit_station
    @list_of_journeys = []
  end

  def top_up(amount)
    fail "Card reached the GBP#{LIMIT} limit" if @balance + amount > LIMIT
    @balance += amount
  end
  
  def touch_in(entry_station)
    @journey = Journey.new(entry_station)
    @entry_station = entry_station
    raise "Minimum amount to travel is £1" if @balance < MINIMUM_BALANCE
  end

  def touch_out(exit_station)
    
    @entry_station = nil
    @exit_station = exit_station
    @list_of_journeys << @journey.finish(exit_station)
    deduct(journey.fare)
   

  end
  
  def in_journey?
    !@entry_station.nil?
  end

private

  def deduct(amount)
    @balance -= amount
  end

end
