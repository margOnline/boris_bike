require_relative 'container'

class Station < Container

  attr_accessor :working_bikes, :broken_bikes
  attr_reader :max_capacity

  def initialize(max_capacity)
    @working_bikes = []
    @max_capacity = max_capacity
    @broken_bikes = []
  end

  def store_broken(bike)
    if bike.is_broken? && has_space?
      @broken_bikes.push(bike)
    else
      messages[:station_full]
    end
  end

end