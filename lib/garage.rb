#all bikes delivered to garage are broken
#need to include max capacity check

class Garage

  attr_accessor :fixed_bikes, :broken_bikes

  def initialize()
    @fixed_bikes = []
    @broken_bikes = []
  end

  def check_in(bikes)
    @broken_bikes.concat bikes
  end

  def fix(bike)
    bike.fix!
    @broken_bikes.delete(bike)
    @fixed_bikes.push(bike)
  end

  def check_out
    @fixed_bikes = []
  end

  def call_van(van, fixed_bikes)
    van.fill(fixed_bikes)    
  end

end
