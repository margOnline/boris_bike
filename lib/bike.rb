class Bike

  attr_reader :bike_id

  def initialize (bike_id)
    @bike_id = bike_id
    @broken = false
  end

  def break!
    @broken = true
  end

  def fix!
    @broken = false    
  end

  def is_broken?
    @broken
  end

end