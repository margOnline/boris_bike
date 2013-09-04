class Station

  attr_accessor :bikes, :capacity, :broken_bikes
  attr_reader :max_capacity

#need to keep track of number of bikes we have
#and number of broken bikes


  def initialize(bikes)
    @bikes = bikes
    
    @max_capacity = @bikes.length
    @capacity = max_capacity
    @broken_bikes = []
   
  end

  def store_broken(bike)
    broken_bikes.push(bike) if bike.is_broken?
  end

  # def has_bikes?
  #   @capacity > 0   
  # end

  def check_out
    bikes.pop if bikes.length > 0
  end

# put a check in
  def check_in(bike)
    #check sum of 2 bike arrays
  end
end