require "docking_station"
describe DockingStation do 
  it {should respond_to(:release_bike)}
  subject.release_bike {is_expected.to eq Bike.new} 
end 


