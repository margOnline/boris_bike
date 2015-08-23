require 'station'

describe 'Station' do

  let(:bike) { double(:bike) }
  let(:station) {Station.new(3)}

  it 'stores broken bikes' do
    broken_bike = double :bike, {:is_broken? => true}
    station.store_broken(broken_bike)
    expect(station.broken_bikes).to eq [broken_bike]  
  end
  
end

