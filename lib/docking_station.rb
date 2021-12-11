require_relative 'bike'
class DockingStation
  attr_accessor :bikes

  def initialize
    @bikes = []
   end

  def dock(bike)
    full? ? fail("Sorry, Dock is Full") : bikes << bike
  end
  
  def release_bike
    empty? ? fail("Sorry, No Bikes Available") : bikes.pop
  end

  private

  def empty?
    bikes.empty?        
  end

  def full?
    bikes.size >= 20
  end
end