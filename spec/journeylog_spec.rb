# Initialize the JourneyLog with a journey_class parameter 
# (hint: journey_class expects an object that knows how to create Journeys. 
# Can you think of an object that already does this?)
#  #start should start a new journey with an entry station
#  a private method #current_journey should return an incomplete journey or create a new journey
#  #finish should add an exit station to the current_journey
#  #journeys should return a list of all previous journeys without exposing the internal array to external modification
#  remove redundant code from OysterCard class
require 'journeylog'

describe JourneyLog do
  
  describe '#initialize' do
    
    it 'initialises with a journey_class parameter' do
      # double(:journey_double) { double :journal_instance }
      # double(:journey_class_double) { double :journey_class, new: journey_double }
      # log = journey_class.new(journey_class)
      expect(subject.journey_class).to eq(Journey)
    end
  end

  describe "#start" do 
    it "starts a new journey with an entry station" do
      expect(subject).to respond_to(:start).with(1).argument
    end 

    it "returns an entry station when #start is calles" do  
      station = "Paddington"
      expect(subject.start(station)).to include station
  end 
  end 

  describe "#finish" do 
    it "finishes a journey and adds an exit station" do
      expect(subject).to respond_to(:finish).with(1).argument
    end 

    it "returns an exit station when called finish" do 
      station = "Mayfair"
      expect(subject.finish(station)).to include station
    end 
end 
end