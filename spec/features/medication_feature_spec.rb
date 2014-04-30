require 'spec_helper'

describe "medication" do
  context 'no medication added' do
    let(:rick) { create(:user)} 
    it 'should show a message' do
      login_as rick
      visit '/medications'

      expect(page).to have_content "You don't take any medication :)"
    end
  end

  context 'adding medication' do 
    let(:rick) { create(:user) }
    before { login_as rick }

    it 'displays on the page' do 
      visit '/medications/new'
      fill_in 'Medication', with: 'Pulmecort'
      fill_in 'Dose', with: '2mg'
      click_button 'Create Medication'

      find_field('medication_dose').value.should eq '2mg'
    end
  end
end