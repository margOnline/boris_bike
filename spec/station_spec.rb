require 'station'

describe 'Station' do

  let(:station) {Station.new(100)}

  it 'should check out bikes' do
    expect(station.capacity).to eq 100
  end

  it 'should check if bike is broken' do
    bike = double :bike, { 'is_broken?' => false }
    expect(station.check_bike?(bike)).to be_false
  end

  it 'if station is empty' do
    pending
  end

end
