require_relative 'bike'

class DockingStation
    attr_reader :bikes

    def initialize
        @bikes = []
    end

    def release_bike
        @bikes.empty? ? fail("Sorry, No Bikes Available") : @bikes.pop
    end

    def dock(bike)
        @bikes.size >= 20 ? fail("Sorry, Dock is Full") : @bikes << bike
    end
end