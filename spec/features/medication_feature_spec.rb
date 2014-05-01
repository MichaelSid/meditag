require 'spec_helper'

describe "medication", :js => true do
  let(:rick) { create(:user) }
  before { login_as rick }
  
  context 'no medication added' do
   
    it 'should show a message' do
      visit '/medications'
      expect(page).to have_content "You don't take any medication :)"
    end
  end

  context 'adding medication' do 
    before do 
      visit '/medications/new'
    end

    it 'displays on the page' do 
      fill_in 'Medication', with: 'Pulmecort'
      fill_in 'Dose', with: '2mg'
      click_button 'Save Medications'

      find_field('Dose').value.should eq '2mg'
    end
  end


end