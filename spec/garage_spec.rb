require 'garage'


describe 'Garage' do

  let(:garage) {Garage.new}

  it 'should check in bikes' do
    bike1 = double :bike
    bike2 = double :bike
    bikes = bike1, bike2
    garage.check_in(bikes)
    expect(garage.broken_bikes).to eq [bike1, bike2]
  end

  it 'removes broken bike from broken bike array' do
    bike = double :bike, fix!: true
    garage.broken_bikes = [bike]
    garage.fix(bike)
    expect(garage.broken_bikes).to eq []
  end

  it 'puts the fixed bike into the fixed bike array' do
    bike = double :bike, fix!: true
    garage.fix(bike)
    expect(garage.fixed_bikes).to eq [bike]
  end  

  it 'should check out bikes' do
    bike = double :bike
    garage.check_out
    expect(garage.fixed_bikes).to eq []
  end

  

end

  # it 'checks if the bike is broken' do
  #   bike = double(:bike)
  #   expect(bike).to receive(:is_broken?)
  #   garage.check_bike?(bike)
  # end

  # it 'if it is broken takes the bike' do
  #   bike = double :bike, { 'is_broken?' => true }
  #   expect(garage.check_bike?(bike)).to be_true
  # end

  # it 'if it is not broken rejects the bike' do
  #   bike = double :bike, { 'is_broken?' => false }
  #   expect(garage.check_bike?(bike)).to be_false
  # end

  # it 'fixes bikes which are broken' do
  #   bike = double :bike
  #   bike.should_receive(:fix!)
  #   garage.fix bike
  # end
