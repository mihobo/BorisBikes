class Bike

  attr_accessor :condition

  def initialize(condition = "good")
    @condition = condition
  end

  def working?
    @condition == "good" ? true : false
  end


end
