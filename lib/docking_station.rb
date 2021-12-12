require_relative 'bike'

class DockingStation
  attr_accessor :bikes

  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
   end

  def dock(bike)
    fail("Sorry, Dock is Full") if full?
    bikes << bike
  end
  
  def release_bike
    fail("Sorry, No Working Bikes Available") if empty? || none_working?
    bikes.delete_at(bikes.index { |bike| bike.working? })
  end

  private

  def empty?
    bikes.empty?
  end

  def full?
    bikes.size >= @capacity
  end

  def none_working?
    bikes.find { |bike| bike.working? } == nil
  end
end