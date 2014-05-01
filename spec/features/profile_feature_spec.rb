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

    fill_in 'First Name', with: "John"
    fill_in 'Last Name', with: "Smith"
    fill_in 'D.O.B', with: "28-04-1988"
    fill_in 'Contact Number', with: "0800123456"
    fill_in 'Address Line 1', with: "15"
    fill_in 'Address Line 2', with: "A road"
    fill_in 'Town', with: "London"
    fill_in 'County', with: "Sussex"
    fill_in 'Country', with: "England"
    fill_in 'Postcode', with: "sw14g"
    fill_in 'Gender', with: "male"

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
        fill_in 'Last Name', with: 'Brown'
        click_button 'Update Profile'
        expect(current_path).to eq "/profile/edit"
        find_field('profile_lastname').value.should eq 'Brown'

      end
    end
  end
end