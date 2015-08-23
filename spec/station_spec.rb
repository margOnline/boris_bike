require 'station'

describe 'Station' do

  let(:bike) { double(:bike) }
  let(:station) {Station.new(3)}

  it 'knows if it has bikes' do
    station.bikes = [:bike1, :bike2, :bike3]
    expect(station.bikes.length).to eq 3
  end

  it 'knows if it doesn\'t have bikes' do
    expect(station.bikes.length).to eq 0
  end

  it 'checks out bikes' do
    station.bikes = [:bike1, :bike2, :bike3]
    station.check_out
    expect(station.bikes.length).to eq 2 
  end

  it 'does not check out bikes if it doesn\'t have any' do
    expect(station.check_out).to eq 'Please see list for nearest station.'
  end

  it 'checks in bikes' do
    bikes = [:bike4, :bike5, :bike6]
    station.check_in(bikes)
    expect(station.bikes).to eq [:bike4, :bike5, :bike6]
  end  

  it 'knows if its full' do
    station.bikes = [:bike1, :bike2, :bike3]
    expect(station.full?).to eq true
  end  

  it 'knows if it has spaces' do
    station.bikes = [:bike1, :bike2]
    expect(station.has_space?).to eq true
  end

  it 'calls garage when broken bike checked in' do
    broken_bike = double :bike, {:is_broken? => true}
    van = double :van, {:accept_bike => broken_bike} 
    station.bikes = [:bike1, :bike2]

    van.should_receive(:accept_bike).with(broken_bike)
    station.store_broken(broken_bike, van)
  end
  
end

