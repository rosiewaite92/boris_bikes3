require "docking_station"
describe DockingStation do 
  describe '#release_bike' do 
    it 'raises an error when there are no bikes available' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end 
  end 

  it 'releases a bike' do 
    bike = Bike.new
    subject.dock(bike)
    expect(subject.release_bike).to eq bike 
  end 

  it {should respond_to(:release_bike)}

  it {should respond_to(:dock).with(1).argument}

  it 'releases working bikes' do 
    bike = Bike.new
    subject.dock(bike)
    expect(subject.release_bike).to be_working
  end 

  it "raises an error when the docking station is full" do 
    DockingStation::DEFAULT_CAPACITY.times { subject.dock(Bike.new) }
    expect { subject.dock(Bike.new) }.to raise_error "Station full"
  end 

  it "defaults to default capcity if no capacity set" do 
     expect ( subject.capacity).to eq DockingStation::DEFAULT_CAPACITY 
  end 
end 

