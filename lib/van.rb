class Van
  
  attr_accessor :capacity, :broken_bikes, :fixed_bikes
  attr_reader :max_capacity

  def initialize(max_capacity)
    @max_capacity = max_capacity
    @broken_bikes = []
    @fixed_bikes = []
  end

  def bike_broken?(bike)
    bike.is_broken?(bike)
  end

  def full?
    (@fixed_bikes.length + @broken_bikes.length) >= @max_capacity
  end

  def has_space?
    !full?
  end

  def accept_bike(bikes)
    @broken_bikes = bikes.select {|bike| bike_broken?(bike)}
    # from station
  end

  def deliver_bike(broken_bikes, garage)
    garage.check_in(broken_bikes)
    #to garage - 
  end

  def empty
    @broken_bikes = []
  end

  def fill(fixed_bikes)
    @fixed_bikes = fixed_bikes.each {|bike| @fixed_bikes.push(bike)}
  end


end
