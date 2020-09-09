require 'journey'
require 'oystercard'

describe Journey do
  it 'initialises with a starting station' do
    day_out = Journey.new("station")
    expect(day_out.entry_station).to eq "station"
  end

  describe 'end' do
    it "creates a journey from exit and entry" do
      day_out = Journey.new("station") 
      expect(day_out.finish("exit")).to be_an_instance_of(Hash) 
    end
  end

  
  describe 'fare' do
    # it "fare will whether check entry or exit stations are present" do
    #   day_out = Journey.new("station")
    #   day_out.end("exit")
    #   day_out.instance_variable_set(:@trip, "Kings Cross" => "Liverpool")
    #   expect(day_out.fare).not_to be_empty
    # end

    it "fare will return minimum fare when both stations are present" do
      day_out = Journey.new("Kings Cross")
      day_out.finish("Liverpool")
      expect(day_out.fare).to eq 1
    end

    it 'will return a penalty if a station is not present' do
      day_out = Journey.new("Kings Cross")
      expect(day_out.fare).to eq 6
    end
  end
end