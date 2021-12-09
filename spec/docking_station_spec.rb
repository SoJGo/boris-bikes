require 'docking_station'

describe DockingStation do
    it { is_expected.to respond_to(:release_bike) }
    
    it 'releases working bike' do
      bike = subject.release_bike
      expect(bike).to be_working
    end

  describe "#dock" do
    it { is_expected.to respond_to(:dock) }
    
    it "adds a bike to docking_station" do
      expect(subject.dock(Bike)).to eq Bike
    end
  end

end