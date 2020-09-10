require_relative 'journey'

class JourneyLog < Journey
  attr_reader :journey_class

  def initialize(journey_class = Journey)
    @journey_class = journey_class
    @journey = []
  end

  
  def current_trip
    @journey << @start
  end 
end