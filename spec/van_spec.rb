require 'van'

describe 'Van' do 
  let(:van) {Van.new(5)}

  it 'knows if it has space to accept bikes' do
    bike1 = double :bike, {:is_broken? => true}
    bike2 = double :bike, {:is_broken? => false}
    bike3 = double :bike, {:is_broken? => true}
    bike4 = double :bike, {:is_broken? => false}
    van.broken_bikes = bike1, bike2
    van.fixed_bikes = bike3, bike4
    expect(van.has_space?).to be_true
  end

  it 'knows if it is full' do
    van = Van.new(2)
    bike1 = double :bike, {:is_broken? => true}
    bike2 = double :bike, {:is_broken? => false}
    van.broken_bikes = bike1, bike2
    expect(van.has_space?).to be_false
  end

  it 'checks in broken bikes' do
    bike1 = double :bike, {:is_broken? => true}
    bike2 = double :bike, {:is_broken? => true}
    bike3 = double :bike, {:is_broken? => false}
    broken_bikes = [bike1, bike2, bike3]
    van.accept_bike(broken_bikes)
    expect(van.broken_bikes).to eq [bike1, bike2]
  end

  it 'delivers bikes to garage' do
    bike1 = double :bike
    bike2 = double :bike
    broken_bikes = bike1, bike2
    garage = double :garage, {:check_in => broken_bikes}
    garage.should_receive(:check_in)
    van.deliver_bike(garage)
  end

  it 'empties van of broken bikes' do
    van.empty
    expect(van.broken_bikes).to eq []
  end

  it 'fills van of fixed bikes' do
    bike1 = double :bike
    bike2 = double :bike
    fixed_bikes = bike1, bike2
    van.fill(fixed_bikes)
    expect(van.fixed_bikes).to eq [bike1, bike2]
  end 
  
  it 'calls station\'s check in method' do
    bike1 = double :bike
    bike2 = double :bike
    fixed_bikes = bike1, bike2
    station = double :station, {:check_in => fixed_bikes}
    station.should_receive(:check_in).with(fixed_bikes)
    van.call_station(fixed_bikes, station)
  end


end
# additional features to add:
# recognise location ie garage or station
# recognise if not full go to another station
# get more bikes 

