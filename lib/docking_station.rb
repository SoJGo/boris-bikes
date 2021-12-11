require_relative 'bike'

class DockingStation
    attr_reader :bike

    def release_bike
        @bike ? @bike : fail("Sorry, No Bikes Available")
    end

    def dock(bike)
        @bike = bike
    end
end