#all new stations are delivered fully loaded with working bikes
#2 arrays to keep track of working bikes and broken bikes

class Station

  attr_accessor :bikes, :broken_bikes
  attr_reader :max_capacity

  def initialize(bikes)
    @bikes = bikes
    @max_capacity = @bikes.length
    @broken_bikes = []
   
  end

  def check_out
    if @bikes.length > 0
      @bikes.pop 
    else
      'Please see list for nearest station.'
    end

  end

  def check_in(bike)
    if bikes.length < @max_capacity
      @bikes.push(bike)
    else
      'Station full, see list for nearest station.'
    end
  end

  def store_broken(bike)
    if bike.is_broken? && (@bikes.length + @broken_bikes.length < @max_capacity)
      @broken_bikes.push(bike) 
      van.accept_bike(bike)
    else
      'Station full, see list for nearest station.'
    end
  end
end