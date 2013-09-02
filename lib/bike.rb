class Bike

  attr_accessor :broken

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