class Bike
  def initialize
    @condition = "working"
  end

  def report_broken
    @condition = "broken"
  end

  def working?
    @condition == "working" ? true : false
  end
end