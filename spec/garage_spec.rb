require 'garage'

describe 'Garage' do

  it 'checks if the bike is broken' do
    garage = Garage.new
    bike = double(:bike)

    expect(bike).to receive(:is_broken?)

    garage.check_bike?(bike)
  end

  it 'takes the bike if it is broken' do
    garage = Garage.new

    bike = double :bike, { 'is_broken?' => true }

    expect(garage.check_bike?(bike)).to be_true
  end

  it 'rejects the bike if it is broken' do
    garage = Garage.new

    bike = double :bike, { 'is_broken?' => false }

    expect(garage.check_bike?(bike)).to be_false
  end

end