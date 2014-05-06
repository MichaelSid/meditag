require 'spec_helper'

describe 'emergencycontact' do 
  context 'adding to user' do
    before do 
      @user = create(:user)
    end
    it "saves to database" do
      create(:emergencycontact, user: @user)

      expect(Emergencycontact.count).to eq 1
    end
  end
end

