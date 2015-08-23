require 'bike'

describe 'Bike' do
  let(:bike) {Bike.new(4) }

  it 'is not broken' do
    expect(bike.is_broken?).to eq false
  end

  it 'breaks' do
    bike.break! 
    expect(bike.is_broken?).to eq true
  end

  it 'fixes' do
    bike.fix!
    expect(bike.is_broken?).to eq false
  end
end
