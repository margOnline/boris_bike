require 'container'

RSpec.describe Container do

  subject { described_class.new(3) }
  let(:bike) { double(:bike) }

  it 'knows if it has bikes' do
    subject.working_bikes = [:bike1, :bike2, :bike3]
    expect(subject.working_bikes.length).to eq 3
  end

  it 'knows if it doesn\'t have bikes' do
    expect(subject.working_bikes.length).to eq 0
  end

  it 'checks out bikes' do
    subject.working_bikes = [:bike1, :bike2, :bike3]
    subject.check_out
    expect(subject.working_bikes.length).to eq 2 
  end

  it 'does not check out bikes if it doesn\'t have any' do
    expect(subject.check_out).to eq 'Please see list for nearest container.'
  end

  it 'checks in bikes' do
    bikes = [:bike4, :bike5, :bike6]
    subject.check_in(bikes)
    expect(subject.working_bikes).to eq [:bike4, :bike5, :bike6]
  end  

  it 'knows if its full' do
    subject.working_bikes = [:bike1, :bike2, :bike3]
    expect(subject.full?).to eq true
  end  

  it 'knows if it has spaces' do
    subject.working_bikes = [:bike1, :bike2]
    expect(subject.has_space?).to eq true
  end
  
end