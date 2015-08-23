#all bikes delivered to garage are broken
#need to include max capacity check

class Garage

  attr_accessor :fixed_bikes, :broken_bikes
  attr_reader :max_capacity

  def initialize(max_capacity)
    @max_capacity = max_capacity
    @fixed_bikes = []
    @broken_bikes = []
  end

  def check_in(bikes)
    @broken_bikes.concat bikes
  end

  def check_out
    @fixed_bikes = []
  end

  def full?
    (@fixed_bikes.length + @broken_bikes.length) >= @max_capacity
  end

  def has_space?
    !full?
  end

  def fix(bike)
    bike.fix!
    @broken_bikes.delete(bike)
    @fixed_bikes.push(bike)
  end

  def call_van(van, fixed_bikes)
    van.fill(fixed_bikes)    
  end

end
