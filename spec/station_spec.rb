require 'station'

describe 'Station' do

  let(:station) {Station.new(%w(bike1 bike2 bike3 bike4))}

  it 'should know if bike is broken' do
    bike = double :bike, { 'is_broken?' => false }
    expect(station.check_bike?(bike)).to be_false
  end

  it 'should know if bike is not broken' do
    bike = double :bike, { 'is_broken?' => true }
    expect(station.check_bike?(bike)).to be_true
  end

  it 'should know if it has bikes' do
    expect(station.has_bikes?).to be_true 
  end

  it 'should know if it doesn\'t have bikes' do
    station = Station.new(%w())
    expect(station.has_bikes?).to be_false
  end

  it 'should check out bikes' do
    expect(station.check_out).to eq "bike4"
  end

  it 'should not check out bikes if it doesn\'t have any' do
    station = Station.new(%w())
    expect(station.check_out).to be_false
  end

  it 'should know its rentable capacity' do
    station.broken_bikes = %w().count
    expect(station.rentable_capacity).to eq 50
  end

  it 'should only check out bikes if it has rentable capacity' do

    expect(station.check_out).to be_true
  end  

  # it 'should only check out non broken bikes' do
    
  #   expect(station.check_out)
  #   # expect(station.capacity).to eq 100
  #   # expect()
  # end

  it 'if station is empty' do
    pending
    expect
  end

end
