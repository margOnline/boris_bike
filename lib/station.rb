class Station

  attr_accessor :bikes, :capacity, :broken_bikes
  attr_reader :max_capacity

#need to keep track of number of bikes we have
#and number of broken bikes


  def initialize(bikes)
    @bikes = bikes
    
    @max_capacity = @bikes.length
    @capacity = max_capacity
    @broken_bikes = 0
  end

  def check_bike?(bike)
    store_broken_bike if bike.is_broken?
  end

  def store_broken_bike
    @broken_bikes += 1  
  end

  def has_bikes?
    @capacity > 0   
  end

  def check_out
    if has_bikes? && rentable_capacity > 0 
      @capacity -= 1 
      bikes.pop
    end
  end

  def rentable_capacity
    rentable_capacity = @capacity - @broken_bikes
  end
end