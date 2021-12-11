require 'docking_station'

describe DockingStation do
  it { is_expected.to respond_to(:release_bike) }
  it { is_expected.to respond_to(:dock) }

  it 'can have defualt capacity overridden at initialization' do
    docking_station = DockingStation.new(4)
    4.times { docking_station.dock(Bike.new) }
    expect { docking_station.dock(Bike.new) }.to raise_error "Sorry, Dock is Full"
  end
    
  describe '#dock' do
    it 'adds a bike to docking_station' do
      expect(subject.dock(Bike.new)).to eq subject.bikes
    end

    it 'raises an error if the dock is full at default capacity' do
      20.times { subject.dock(Bike.new) }
      expect { subject.dock(Bike.new) }.to raise_error "Sorry, Dock is Full"
    end
  end
  
  it 'will accept broken bikes' do
    bike = Bike.new
    bike.report_broken
    subject.dock(bike)
    expect(subject.bikes.count).to eq 1
  end

  describe '#release_bike' do
    it 'releases working bike if one is in the dock' do
      subject.dock(Bike.new)
      bike = Bike.new
      bike.report_broken
      subject.dock(bike)
      expect(subject.release_bike).to be_working
    end

    it 'raises an error if there is not a bike in the dock' do
      expect { subject.release_bike }.to raise_error "Sorry, No Working Bikes Available"
    end

    it 'will not release broken bikes' do
      bike = Bike.new
      bike.report_broken
      subject.dock(bike)
      expect { subject.release_bike }.to raise_error "Sorry, No Working Bikes Available"
    end
  end
end