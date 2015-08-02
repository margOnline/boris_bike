#all new stations are delivered fully loaded with working bikes
#2 arrays to keep track of working bikes and broken bikes
class Station

  attr_accessor :bikes, :broken_bikes
  attr_reader :max_capacity

  def initialize(bikes)
    @bikes = bikes
    @max_capacity = 10
    @broken_bikes = []
  end

  def check_out
    @bikes.any? ? @bikes.pop : 'Please see list for nearest station.'
  end

  def check_in(bikes)
    has_space? ? @bikes.concat(bikes) : station_full_message
  end

  def full?
    (@bikes.length + @broken_bikes.length) >= @max_capacity
  end

  def has_space?
    !full?
  end

  def store_broken(bike, van)
    if bike.is_broken? && has_space?
      @broken_bikes.push(bike)
      van.accept_bike(bike)
    else
      station_full_message
    end
  end

  private
  def station_full_message
    'Station full, see list for nearest station.'
  end
end