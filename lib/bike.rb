class Bike

  attr_accessor :broken

  def initialize
#    @broken = true
  end

  def is_broken?
    @broken ? true : false    
  end

  def set_broken
    @broken = @broken ? false : true
  end


end