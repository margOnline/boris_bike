require_relative 'container'

class Van < Container
  
  attr_accessor :capacity, :broken_bikes, :working_bikes
  attr_reader :max_capacity

  def initialize(max_capacity)
    @max_capacity = max_capacity
    @broken_bikes = []
    @working_bikes = []
  end

  def accept_bike(bikes)
    @broken_bikes = bikes.select {|bike| bike.is_broken? }
  end

  def deliver_bike(garage)
    garage.check_in(@broken_bikes)
  end

  def empty
    @broken_bikes = []
  end

  def fill(bikes)
    bikes.each do |bike|
      bike.is_broken? ? @broken_bikes << bike : @working_bikes << bike
    end
  end

  def call_station(working_bikes, station)
    station.check_in(working_bikes)    
  end

end
