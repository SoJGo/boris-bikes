require 'docking_station'

describe DockingStation do
    it { is_expected.to respond_to(:release_bike) }
    it { is_expected.to respond_to(:dock) }
    
  describe '#dock' do
    it 'adds a bike to docking_station' do
      expect(subject.dock(bike)).to eq bike
    end
  end

  describe '#release_bike' do
    it 'should get an error if there is not a bike in the dock' do
      expect { subject.release_bike }.to raise_error "Sorry, No Bikes Available"
    end

    it 'releases working bike if a bike has been docked' do
      subject.dock(Bike.new)
      expect(subject.release_bike.working?).to eq true
    end
  end
end