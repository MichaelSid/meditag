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

    fill_in 'gpdetail_firstname', with: "Hannibal"
    fill_in 'gpdetail_lastname', with: "Lecter"
    fill_in 'gpdetail_faxnumber', with: "28-04-1988"
    fill_in 'gpdetail_contactnr', with: "0800123456"
    fill_in 'gpdetail_address1', with: "15"
    fill_in 'gpdetail_address2', with: "A road"
    fill_in 'gpdetail_town', with: "London"
    fill_in 'gpdetail_county', with: "Sussex"
    select("United Kingdom", :from => "gpdetail_country")
    fill_in 'gpdetail_postcode', with: "sw14g"


    click_button 'Update'      

    expect(current_path).to eq "/gpdetail/edit"
    expect(find_field('gpdetail_firstname').value).to eq 'Hannibal'
    expect(find_field('gpdetail_country').value).to eq 'United Kingdom'
    end


    context 'editing profile' do 
      before do
        login_as rick
        create(:profile, user: rick)
      end

      it 'should update the Gp details' do 
        visit '/gpdetail/edit'
        fill_in 'gpdetail_lastname', with: 'Lecter'
        click_button 'Update'
        expect(current_path).to eq "/gpdetail/edit"
        find_field('gpdetail_lastname').value.should eq 'Lecter'
      end
    end
  end
 
end


