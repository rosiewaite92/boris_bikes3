require "docking_station"
describe DockingStation do 
  describe '#release_bike' do 
    it 'raises an error when there are no bikes available' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end 
  end 

  it 'releases a bike' do 
    bike = double(:bike)
    subject.dock(bike)
    expect(subject.release_bike).to eq bike 
  end 

  it {should respond_to(:release_bike)}

  it {should respond_to(:dock).with(1).argument}

  it 'releases working bikes' do 
    bike = double(:bike)
    subject.dock(bike)
    expect(subject.release_bike).to be_working
  end 

  it "raises an error when the docking station is full" do 
    subject.capacity.times { subject.dock(double(:bike)) }
    expect { subject.dock(double(:bike)) }.to raise_error "Station full"
  end 

  it "defaults to default capcity if no capacity set" do 
     expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY 
  end 

  it "allows a custom capacity to be changed" do 
    docking_station = DockingStation.new(16)
    expect(docking_station.capacity).to eq 16
  end 

  it "only releases working bikes" do
    bike1 = double(:bike)
    bike2 = double(:bike)
    bike2.report_broken
    subject.dock(bike1)
    subject.dock(bike2)

    expect(subject.release_bike).to eq bike1
  end 

end 

