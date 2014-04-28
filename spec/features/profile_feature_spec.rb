require 'spec_helper.rb'

describe "User profile page" do
  context 'No information yet' do
    it 'displays a message' do 
      visit '/profile/new'

      expect(page).to have_content 'Add information.'
    end
  end
end