class Van
  
  attr_accessor :capacity
  attr_reader :max_capacity

  def initialize(max_capacity,capacity=0)
    @capacity = capacity
    @max_capacity = max_capacity
  end

  def accept_bike?
    @capacity < @max_capacity
  end

  def store_bike
    @capacity += 1
  end

  def deliver_bike
    @capacity = 0
  end

end