class Van
  
  attr_accessor :capacity, :broken_bikes, :fixed_bikes
  attr_reader :max_capacity

  def initialize(max_capacity)
    @max_capacity = max_capacity
    @broken_bikes = []
    @fixed_bikes = []
  end

  def accept_bike(bikes)
    @broken_bikes = bikes.select {|bike| bike.is_broken? }
  end

  def deliver_bike(garage)
    garage.check_in(@broken_bikes)
  end

  def full?
    (@fixed_bikes.length + @broken_bikes.length) >= @max_capacity
  end

  def has_space?
    !full?
  end

  def empty
    @broken_bikes = []
  end

  def fill(fixed_bikes)
    @fixed_bikes.concat fixed_bikes
  end

  def call_station(fixed_bikes, station)
    station.check_in(fixed_bikes)    
  end

end
