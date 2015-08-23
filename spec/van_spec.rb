require 'van'

describe 'Van' do 
  let(:van) {Van.new(5)}
  let(:bike1){double :bike, is_broken?: true}
  let(:bike2){double :bike, is_broken?: true}

  it 'checks in broken bikes' do
    bike1 = double :bike, {is_broken?: true}
    bike2 = double :bike, {is_broken?: true}
    bike3 = double :bike, {is_broken?: false}
    bikes = [bike1, bike2, bike3]
    van.accept_bike(bikes)
    expect(van.broken_bikes).to eq [bike1, bike2]
  end

  it 'delivers bikes to garage' do
    broken_bikes = [bike1, bike2]
    garage = double :garage, {:check_in => broken_bikes}
    expect(garage).to receive(:check_in)
    van.deliver_bike(garage)
  end

  it 'empties van of broken bikes' do
    van.empty
    expect(van.broken_bikes).to eq []
  end

  it 'fills van of fixed bikes' do
    bike1 = double :bike, {is_broken?: false}
    bike2 = double :bike, {is_broken?: false}
    fixed_bikes = [bike1, bike2]
    van.fill(fixed_bikes)
    expect(van.working_bikes).to eq [bike1, bike2]
  end 
  
  it 'calls station\'s check in method' do
    fixed_bikes = [bike1, bike2]
    station = double :station, {:check_in => fixed_bikes}
    expect(station).to receive(:check_in).with(fixed_bikes)
    van.call_station(fixed_bikes, station)
  end

end
