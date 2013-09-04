require 'station'

describe 'Station' do

  let(:station) {Station.new([:bike1, :bike2, :bike4])}

  it 'knows if it has bikes' do
    expect(station.bikes.length).to eq 3
  end

  it 'knows if it doesn\'t have bikes' do
    station = Station.new([])
    expect(station.bikes.length).to eq 0
  end

  it 'knows if has reached full capacity' do
    station.bikes = [:bike3]
    station.broken_bikes = [:bike1, :bike2]
    expect(station.bikes.length + station.broken_bikes = station.max_capacity).to be_true
  end

  it 'checks out bikes' do
    station.check_out
    expect(station.bikes.length).to eq 2 
  end

  it 'should not check out bikes if it doesn\'t have any' do
    station = Station.new([])
    expect(station.check_out).to eq 'Please see list for nearest station.'
  end

  it 'checks in bikes' do
    bike = double :bike
    station.bikes = []
    station.check_in(bike)
    expect(station.bikes.length).to eq 1
  end  

  it 'doesn\'t check in bikes if it will exceed max_capacity' do
    bike = double :bike
    station.check_in(bike)
    expect(station.check_in(bike)).to eq 'Station full, see list for nearest station.'
  end  

  it 'calls garage when broken bike checked in' do
      broken_bike = double :bike, {:is_broken? => true}
      van = double :van, {:accept_bike => broken_bike} 
      van.should_receive(:accept_bike).with(broken_bike)
      station.store_broken(broken_bike)
  end
  
  it 'if station is empty' do
    pending 'build feature to call vans to deliver bikes'
    expect
  end
end

