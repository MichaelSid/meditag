require 'spec_helper.rb'

describe "User profile page" do
  context 'No information yet' do
    it 'displays a message' do 
      login_as create(:user)
      visit '/profile/edit'

      expect(page).to have_content 'Your Information'
    end
  end

  context 'information was previously added' do
    let(:rick) { create(:user) }

    it 'displays all the information entered by user' do
    login_as rick
    visit '/profile/new'

    fill_in 'profile_firstname', with: "John"
    fill_in 'profile_lastname', with: "Smith"
    fill_in 'profile_dob', with: "28-04-1988"
    fill_in 'profile_contactnr', with: "0800123456"
    fill_in 'profile_address1', with: "15"
    fill_in 'profile_address2', with: "A road"
    fill_in 'profile_town', with: "London"
    fill_in 'profile_county', with: "Sussex"
    fill_in 'profile_country', with: "England"
    fill_in 'profile_postcode', with: "sw14g"
    fill_in 'profile_gender', with: "male"

    click_button 'Create Profile'      

    expect(current_path).to eq "/profile/edit"
    expect(page).to have_content 'London'
    end

    context 'editing profile' do 
      before do
        login_as rick
        create(:profile, user: rick)
      end

      it 'should update the profile' do 
        visit '/profile/edit'
        fill_in 'profile_lastname', with: 'Brown'
        click_button 'Update Profile'
        expect(current_path).to eq "/profile/edit"
        find_field('profile_lastname').value.should eq 'Brown'

      end
    end
  end
end