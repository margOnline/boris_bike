class Van
  
  attr_accessor :capacity
  attr_reader :max_capacity

  def initialize(max_capacity,capacity=0)
    @capacity = capacity
    @max_capacity = max_capacity
  end

  def bike_broken?(bikes)
    broken_bikes = bikes.select {|bike| bike.is_broken?}

  end

  def accept_bike
    #check bike is broken
    #where is bike from
    @capacity < @max_capacity
    #from where:
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