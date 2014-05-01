require 'spec_helper'

describe "GP details page" do
  context 'No details yet' do
    it 'displays a message' do 
      login_as create(:user)
      visit '/gpdetail/new'

      expect(page).to have_content 'Add details below'
    end
  end

  context 'information was previously added' do
    let(:rick) { create(:user) }

    it 'displays all the information entered by user' do
    login_as rick
    visit '/gpdetail/new'

    fill_in 'First Name', with: "Hannibal"
    fill_in 'Last Name', with: "Lecter"
    fill_in 'Fax Number', with: "28-04-1988"
    fill_in 'Contact Number', with: "0800123456"
    fill_in 'Address Line 1', with: "15"
    fill_in 'Address Line 2', with: "A road"
    fill_in 'Town', with: "London"
    fill_in 'County', with: "Sussex"
    fill_in 'Country', with: "England"
    fill_in 'Postcode', with: "sw14g"

    click_button 'Update'      

    expect(current_path).to eq "/gpdetail/edit"
    expect(page).to have_content 'Hannibal'
    end

    context 'editing profile' do 
      before do
        login_as rick
        create(:profile, user: rick)
      end

      it 'should update the Gp details' do 
        visit '/gpdetail/edit'
        fill_in 'Last Name', with: 'Lecter'
        click_button 'Update'
        expect(current_path).to eq "/gpdetail/edit"
        find_field('gpdetail_lastname').value.should eq 'Lecter'

      end
    end
  end
 
end


