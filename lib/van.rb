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
    # where is bike from
    # from where:
    #  station tell station to delete a bike from broken bike array
    #  garage:or tell garage to "    " from its fixed array
  end

  def store_bike
    @capacity += 1
  end

  def deliver_bike
    @capacity = 0
    #to garage - garage must accept bike
    #to station - station must accept bike, 
    #             increment fixed bike array
  end

end