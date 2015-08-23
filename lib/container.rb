class Container

  attr_accessor :working_bikes, :broken_bikes
  attr_reader :max_capacity

  def initialize(max_capacity)
    @max_capacity = max_capacity
    @working_bikes = []
    @broken_bikes = []
  end

  def check_in(bikes)
    has_space? ? @working_bikes.concat(bikes) : messages["container_full"]
  end

  def check_out
    @working_bikes.any? ? @working_bikes.pop : messages["container_empty"]
  end

  def full?
    (@working_bikes.length + @broken_bikes.length) >= @max_capacity
  end

  def has_space?
    !full?
  end

  def messages
    {
      "container_full" =>'Container full, see list for nearest container.',
      "container_empty" => 'Please see list for nearest container.'
    }
  end
end
