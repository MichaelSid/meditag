require 'spec_helper'

describe "emergency contact page" do
  context 'No details yet' do
    it 'displays a message' do 
      login_as create(:user)
      visit '/emergencycontact/new'

      expect(page).to have_content 'New Information'
    end
  end

  context 'information was previously added' do
    let(:rick) { create(:user) }

    it 'displays all the information entered by user' do
    login_as rick
    visit '/emergencycontact/new'

    fill_in 'emergencycontact_firstname', with: "Lucy"
    fill_in 'emergencycontact_lastname', with: "Lecter"
    fill_in 'emergencycontact_relationship', with: "28-04-1988"
    fill_in 'emergencycontact_contactnr', with: "01722222111"
    fill_in 'emergencycontact_address1', with: "15"
    fill_in 'emergencycontact_address2', with: "A road"
    fill_in 'emergencycontact_town', with: "London"
    fill_in 'emergencycontact_county', with: "Sussex"
    fill_in 'emergencycontact_country', with: "England"
    fill_in 'emergencycontact_postcode', with: "sw14g"


    click_button 'Update'      

    expect(current_path).to eq "/emergencycontact/edit"
    expect(find_field('emergencycontact_firstname').value).to eq 'Lucy'
    end


    context 'editing profile' do 
      before do
        login_as rick
        create(:profile, user: rick)
      end

      it 'should update the emergency contact' do 
        visit '/emergencycontact/edit'
        fill_in 'emergencycontact_lastname', with: 'Smith'
        click_button 'Update'
        expect(current_path).to eq "/emergencycontact/edit"
        find_field('emergencycontact_lastname').value.should eq 'Smith'
      end
    end
  end
 
end