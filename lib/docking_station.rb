require_relative 'bike'

class DockingStation
    attr_reader :dock

    def release_bike
        if !@dock
            fail "There is not bike walk please you lazy person!"
        else
            Bike.new
        end
        
    end

    def dock(bike)
        @dock = bike
    end
end