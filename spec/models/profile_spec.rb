require 'spec_helper'

describe 'profile' do 
  context 'adding to user' do
    before do 
      @user = create(:user)
    end
    it "save to database" do
      create(:profile, user: @user)

      expect(Profile.count).to eq 1
    end
  end
end