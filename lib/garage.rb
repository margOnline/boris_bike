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
    bike.fix!
    @broken_bikes.delete(bike)

    @fixed_bikes.push(bike)
  end
end