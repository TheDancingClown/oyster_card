require_relative 'journey'

class JourneyLog 
  attr_reader :journey_class, :journey

  def initialize(journey_class = Journey)
    @journey_class = journey_class
    @journey = []
  end

  def start(station)
    entry_station = journey_class.new(station)
    @journey << entry_station.entry_station
  end 

  def finish(station)
    exit_station = journey_class.new(station)
    @journey << exit_station.entry_station
  end 

  def journeys 
    @journey.clone
  end 
  

end