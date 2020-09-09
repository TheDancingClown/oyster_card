class Journey
  attr_reader :journey, :entry_station, :trip

  def initialize(entry_station)
    @entry_station = entry_station
  end

  def end(exit_station)
    @trip = { @entry_station => exit_station }
    # trip = Hash.new
    # trip[entry_station] = exit_station
  end


  
end