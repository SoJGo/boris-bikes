require "bike"

class DockingStation
    def initialize(bike)
        @bike = bike
    end
    
    def release_bike
        @bike.new
    end
end
