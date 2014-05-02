require 'spec_helper'

describe 'User Medications' do

  let(:rick) { create(:user) }
  before do 
    login_as rick 
    visit '/medications/new'
  end


  describe "Adding a medication", :js => true do
    it 'displays on the page' do 
      fill_in 'Medication', with: 'Pulmecort'
      fill_in 'Dose', with: '2mg'
      click_button 'Save Medications'
      find_field('Dose').value.should eq '2mg'
    end
  end

  describe 'User ticks Emergency checkbox', js: true do
    it 'should set the emergency field to true' do
      create(:medication, user: rick)
      find('.emergency-field').click
      expect(find('.emergency-field')).to be_checked
      click_button 'Save Medications'
      expect(find('.emergency-field')).to be_true
    end
  end

end

