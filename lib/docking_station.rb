require_relative "bike"
class DockingStation
  def initialize
    @bikes = []
  end

  def dock(bike)
    fail "Station full" if @bike
    @bike = bike 
  end 

  def release_bike
    fail 'No bikes available' unless @bike
    @bike
  end 
  
end 
