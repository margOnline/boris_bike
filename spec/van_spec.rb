require 'van'

describe 'Van' do 
  let(:van) {Van.new(5)}

  it 'knows if bikes are broken' do
    bike1 = double :bike, {:is_broken? => true}
    bike2 = double :bike, {:is_broken? => false}
    bikes = bike1, bike2
    van.bike_broken?(bikes)
    expect(van.bike_broken?(bikes)).to eq [bike1]
  end

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

  it 'should store_broken_bikes' do
    bike = double :bike
    van.capacity = 39
    expect(van.store_bike).to eq 40
  end

  it 'should deliver bikes' do
    bike = double :bike
    van.capacity = 40
    expect(van.deliver_bike).to eq 0
  end

  it 'should empty van of nbroken bikes' do

  end

  it 'should fill van of fixed bikes' do

  end 
  
end
# additional features to add:
# recognise location ie garage or station
# recognise if not full go to another station
# get more bikes 

