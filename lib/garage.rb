require_relative 'container'

class Garage < Container

  attr_accessor :bikes, :broken_bikes
  attr_reader :max_capacity

  def initialize(max_capacity)
    @max_capacity = max_capacity
    @bikes = []
    @broken_bikes = []
  end

  def fix(bike)
    bike.fix!
    @broken_bikes.delete(bike)
    @bikes.push(bike)
  end

  def call_van(van, bikes)
    van.fill(bikes)    
  end

end
