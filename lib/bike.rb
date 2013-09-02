class Bike

  attr_accessor :available

  def initialize
    @broken = false
  end

  def break!
    @broken = true
    
  end

  def is_broken?
    @broken
  end
end