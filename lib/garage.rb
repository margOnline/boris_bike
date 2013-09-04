#all bikes delivered to garage are broken

class Garage

  attr_accessor :fixed_bikes, :broken_bikes

  def initialize()
    @fixed_bikes = []
    @broken_bikes = []
  end

  def check_in(bike)
    @broken_bikes.push(bike)
  end

  def fix(bike)
    @broken_bikes.pop
  end
end