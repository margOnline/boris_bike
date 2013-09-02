require 'bike'

class Garage

  def check_bike?(bike)
    bike.is_broken?
  end

  def fix(bike)
    bike.fix!
  end
end