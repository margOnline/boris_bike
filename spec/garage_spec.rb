require 'garage'

describe 'Garage' do

  let(:garage) {Garage.new(3)}

  it 'removes broken bike from broken bike array' do
    bike = double :bike, fix!: true
    garage.broken_bikes = [bike]
    garage.fix(bike)
    expect(garage.broken_bikes).to eq []
  end

  it 'puts the fixed bike into the fixed bike array' do
    bike = double :bike, fix!: true
    garage.fix(bike)
    expect(garage.bikes).to eq [bike]
  end  

  it 'calls van to collect fixed bikes' do
    bike1 = double :bike
    bike2 = double :bike
    bikes = bike1, bike2
    van = double :van, {:fill  => bikes}
    expect(van).to receive(:fill).with(bikes)
    garage.call_van(van, bikes)
  end

end

  