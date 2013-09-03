class Station

  attr_accessor :capacity
  attr_reader :max_capacity

  def initialize(max_capacity)
    @capacity = max_capacity
    @max_capacity = max_capacity
  end

  def check_bike?(bike)
    bike.is_broken?
  end

  def check_station_is_empty?()
    
  end

end