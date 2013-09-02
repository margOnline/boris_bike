require 'bike'

  describe 'Bike' do
    let(:bike) {Bike.new}

    it 'should know if its broken' do
      expect(bike.is_broken?).to be_true

    end
    it 'should know if its not broken' do
      expect(bike.is_broken?).to be_false
    end

    it 'can change from broken to not broken' do
      expect(bike.set_broken).to be_true
    end


  end
  