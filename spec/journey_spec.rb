require 'journey'

describe Journey do

  let(:entry_station){ double :station }
  let(:exit_station) { double :station }

 # it 'initialises with an empty station' do
 #   day_out = Journey.new(entry_station)
 #   expect(day_out.entry_station).to eq nil
 # end

  describe 'end' do
    it "creates a journey from exit and entry" do
      day_out = Journey.new(entry_station)
      day_out.start(entry_station) 
      expect(day_out.finish(exit_station)).to be_an_instance_of(Hash) 
    end
  end
  
  describe 'fare' do

    it "will return minimum fare when both stations are present" do
      day_out = Journey.new(entry_station)
      day_out.start(entry_station) 
      day_out.finish(exit_station)
      expect(day_out.fare).to eq 1
    end

    it 'will return a penalty if a station is not present' do
      day_out = Journey.new(entry_station)
      day_out.start(entry_station) 
      expect(day_out.fare).to eq 6
    end
  end
end
