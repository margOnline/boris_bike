require 'van'

describe 'Van' do 
  let(:van) {Van.new(40)}

  it 'should accept bikes if van has space' do
    bike = double :bike
    van.capacity = 3
    expect(van.accept_bike?).to be_true
  end

  it 'should accept bikes if van does not space' do
    bike = double :bike
    van.capacity = 40
    expect(van.accept_bike?).to be_false
  end

  it 'should store bikes' do
    bike = double :bike
    van.capacity = 39
    expect(van.store_bike).to eq 40
  end

  it 'should deliver bikes' do
    bike = double :bike
    van.capacity = 40
    expect(van.deliver_bike).to eq 0
  end
  
end
# additional features to add:
# recognise full stations and not deliver
# recognise location ie garage or station
# recognise if not full go to another station
# get more bikes 

