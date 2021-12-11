require 'docking_station'

describe DockingStation do
    it { is_expected.to respond_to(:release_bike) }
    it { is_expected.to respond_to(:dock) }
    
  describe '#dock' do
    it 'adds a bike to docking_station' do
      expect(subject.dock(Bike.new)).to eq subject.bike
    end

    it 'raises an error if there is already a bike in the dock' do
      subject.dock(Bike.new)
      expect { subject.dock(Bike.new) }.to raise_error "Sorry, Dock is Full"
    end
  end

  describe '#release_bike' do
    it 'raises an error if there is not a bike in the dock' do
      expect { subject.release_bike }.to raise_error "Sorry, No Bikes Available"
    end

    it 'releases working bike if a bike has been docked' do
      subject.dock(Bike.new)
      expect(subject.release_bike.working?).to eq true
    end
  end
end