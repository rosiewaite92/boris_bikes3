require_relative "bike"
class DockingStation
  def initialize
    @bikes = []
  end

  def dock(bike)
    fail "Station full" if full?
    @bikes << bike 
  end 

  def release_bike
    fail 'No bikes available' if empty?
    @bikes.pop
  end 

  private 

  def full?
    @bikes.count >= 20
  end 

  def empty?
    @bikes.empty?
  end 
  
end 
