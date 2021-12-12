require 'docking_station'

describe DockingStation do
  let(:bike) { double("bike") }
  let(:working_bike) { double("working bike", :working? => true) }
  let(:broken_bike) { double("broken bike", :working? => false) }

  it { is_expected.to respond_to(:release_bike) }
  it { is_expected.to respond_to(:dock).with(1).argument }

  describe '#initalize' do
    it 'can override default capacity' do
      docking_station = DockingStation.new(4)
      4.times { docking_station.dock(bike) }
      expect { docking_station.dock(bike) }.to raise_error "Sorry, Dock is Full"
    end
  end
    
  describe '#dock' do
    it 'adds a bike to docking_station' do
      expect(subject.dock(bike)).to eq subject.bikes
    end

    it 'raises an error if the dock is full at default capacity' do
      20.times { subject.dock(bike) }
      expect { subject.dock(bike) }.to raise_error "Sorry, Dock is Full"
    end

    it 'will accept broken bikes' do
      subject.dock(broken_bike)
      expect(subject.bikes.count).to eq 1
    end
  end

  describe '#release_bike' do
    it 'releases working bike if one is in the dock' do
      subject.dock(working_bike)
      subject.dock(broken_bike)
      expect(subject.release_bike).to be_working
    end

    it 'will not release broken bikes' do
      subject.dock(broken_bike)
      expect { subject.release_bike }.to raise_error "Sorry, No Working Bikes Available"
    end

    it 'raises an error if there is not a bike in the dock' do
      expect { subject.release_bike }.to raise_error "Sorry, No Working Bikes Available"
    end

    it 'raises an error if there are only broken bikes in the dock' do
      subject.dock(broken_bike)
      expect { subject.release_bike }.to raise_error "Sorry, No Working Bikes Available"
    end
  end
end