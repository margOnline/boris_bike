class User

  attr_reader :fname, :lname
  attr_accessor :bike

  def initialize(fname, lname)
    @fname, @lname = fname, lname    
  end

  def rent_bike(station)
    @bike = station.check_out
  end

  def return_bike(station)
    station.check_in(bike)
    @bike = nil
  end

end