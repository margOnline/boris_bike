require 'van'

describe 'Van' do 
  let(:van) {Van.new(5)}

  it 'knows if bikes are broken' do
    bike1 = double :bike, {:is_broken? => true}
    van.bike_broken?(bike1)
    expect(van.bike_broken?(bike1)).to be_true
  end

  it 'knows if bikes aren not broken' do
    bike2 = double :bike, {:is_broken? => false}
    van.bike_broken?(bike2)
    expect(van.bike_broken?(bike2)).to be_false
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

  it 'should check in broken bikes' do
    bike1 = double :bike, {:is_broken? => true}
    bike2 = double :bike, {:is_broken? => true}
    bike3 = double :bike, {:is_broken? => false}
    broken_bikes = [bike1, bike2, bike3]

    van.accept_bike(broken_bikes)

    expect(van.broken_bikes).to eq [bike1, bike2]
  end

  it 'should deliver bikes' do

  end

  it 'should empty van of nbroken bikes' do
    pending
  end

  it 'should fill van of fixed bikes' do
    pending
  end 
  
end
# additional features to add:
# recognise location ie garage or station
# recognise if not full go to another station
# get more bikes 

