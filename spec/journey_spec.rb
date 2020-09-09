require 'journey'

describe Journey do
  it 'initialises with a starting station' do
    day_out = Journey.new("station")
    expect(day_out.entry_station).to eq "station"
  end

  describe 'end' do
    it "creates a journey from exit and entry" do
      day_out = Journey.new("station") 
      expect(day_out.end("exit")).to be_an_instance_of(Hash) 
    end
  end



end

