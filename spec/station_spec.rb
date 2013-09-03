require 'station'

describe 'Station' do

  let(:station) {Station.new(%w(bike1 bike2 bike3 bike4))}

  it 'should know to store broken bike' do
    broken_bike = double :bike, { :bike_id => 5, 'is_broken?' => true }
    station.store_broken(broken_bike)
    expect(station.broken_bikes).to include broken_bike
  end

  
  it 'should know if it has bikes' do
    expect(station.bikes).to eq 
  end

  it 'should know if it doesn\'t have bikes' do
    station = Station.new(%w())
    expect(station.has_bikes?).to be_false
  end

  it 'should check out workingbikes' do
    expect(station.check_out).to eq "bike4"
  end

  it 'should not check out bikes if it doesn\'t have any' do
    station = Station.new(%w())
    expect(station.check_out).to be_false
  end

  it 'should know its working bikes' do
    station.broken_bikes = 3
    expect(station.working_bikes).to eq 1
  end

  it 'should only check out bikes if it has working bikes' do
    expect(station.check_out).to be_true ''
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
