require 'spec_helper.rb'

describe "User profile page" do
  context 'No information yet' do
    it 'displays a message' do 
      visit '/user_profile'

      expect(page).to have_content 'No information yet.'
    end
  end
end