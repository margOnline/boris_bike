require 'user'

describe 'User' do 


  let(:user) {User.new('Sam', 'Harris')}

  it 'should be able to check out a bike' do
    
    expect(user.check_out).to eq 'bike4'
  end


  xit 'should be able to return a bike' do

  end

end