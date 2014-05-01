require 'spec_helper'

describe 'gpdetail' do 
  context 'adding to user' do
    before do 
      @user = create(:user)
    end
    it "saves to database" do
      create(:gpdetail, user: @user)

      expect(Gpdetail.count).to eq 1
    end
  end
end