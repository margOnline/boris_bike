require 'station'

describe 'Station' do

  let(:station) {Station.new([:bike1, :bike2, :bike4])}
  # let(:empty_station) do
  #   Station.new(4)
  #   station.bikes = [:bike1, :bike2]
  # end

  # describe 'empty_station'
  #   before(:each){station.bikes = [:sdflkj]}

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
    bikes = [:bike1, :bike2, :bike4]
    station.check_in(bikes)
    expect(station.bikes).to eq [:bike1, :bike2, :bike4]
  end  

  it 'knows if its full' do
    station = Station.new([])
    station.full?
    expect(station.full?).to be_true
  end  

  it 'calls garage when broken bike checked in' do
    broken_bike = double :bike, {:is_broken? => true}
    van = double :van, {:accept_bike => broken_bike} 
    station.bikes = [:bike1, :bike2]

    van.should_receive(:accept_bike).with(broken_bike)
    station.store_broken(broken_bike, van)
  end
  
  it 'knows if station can check in bikes' do
    station.bikes = [:bike1, :bike2]

    expect(station.has_space?).to be_true
  end

end

