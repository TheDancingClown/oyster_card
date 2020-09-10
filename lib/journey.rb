class Journey
  attr_reader :entry_station, :trip, :exit_station

  MINIMUM_CHARGE = 1
  PENALTY_CHARGE = 6

  def initialize
    @entry_station = nil
    @exit_station = nil
  end

  def start(entry_station)
    @entry_station = entry_station
  end

  def finish(exit_station)
    @exit_station = exit_station
    @trip = { @entry_station => @exit_station }
  end

  def fare 
    if @trip == { @entry_station => @exit_station }
      MINIMUM_CHARGE
    else 
      PENALTY_CHARGE
    end

  end

  
end