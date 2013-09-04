require 'user'

describe 'User' do 


  let(:user) {User.new('Sam', 'Harris')}

  it 'rents a bike from a station' do
    station = double :station
    station.should_receive(:check_out)
    user.rent_bike(station)
  end

  it 'has a bike after renting it from the station' do
    station = double :station, :check_out => :bike
    user.rent_bike(station)
    expect(user.bike).to eq :bike
  end


  it 'return bike to station' do
    station = double :station, :check_in => :bike
    station.should_receive(:check_in)
    user.return_bike(station)
  end

  it 'has no bike' do
    station = double :station, :check_in => :bike
    user.return_bike(station)
    expect(user.bike).to eq nil
  end
  
end