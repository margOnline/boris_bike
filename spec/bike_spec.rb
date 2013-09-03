require 'bike'

describe 'Bike' do
  let(:bike) {Bike.new(4)}

  it 'is not broken' do
    expect(bike.is_broken?).to be_false
  end

  it 'breaks' do
    bike.break! 
    expect(bike.is_broken?).to be_true 
  end
end

#status of bike is broke - will need to be fixed by garage