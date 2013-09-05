require 'garage'


describe 'Garage' do

  let(:garage) {Garage.new}

  it 'should check in bikes' do
    bike1 = double :bike
    bike2 = double :bike
    bikes = bike1, bike2
    garage.check_in(bikes)
    expect(garage.broken_bikes).to eq [bike1, bike2]
  end

  it 'removes broken bike from broken bike array' do
    bike = double :bike, fix!: true
    garage.broken_bikes = [bike]
    garage.fix(bike)
    expect(garage.broken_bikes).to eq []
  end

  it 'puts the fixed bike into the fixed bike array' do
    bike = double :bike, fix!: true
    garage.fix(bike)
    expect(garage.fixed_bikes).to eq [bike]
  end  

  it 'should check out bikes' do
    bike = double :bike
    garage.check_out
    expect(garage.fixed_bikes).to eq []
  end

  it 'calls van to collect fixed bikes' do
    bike1 = double :bike
    bike2 = double :bike
    fixed_bikes = bike1, bike2
    van = double :van, {:fill  => fixed_bikes}
    van.should_receive(:fill).with(fixed_bikes)
    garage.call_van(van, fixed_bikes)
  end

end

  