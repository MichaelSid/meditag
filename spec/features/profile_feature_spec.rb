require 'spec_helper.rb'

describe "User profile page" do
  context 'No information yet' do
    it 'displays a message' do 
      login_as create(:user)
      visit '/profile/edit'

      expect(page).to have_content 'My Profile'
    end
  end

  context 'information was previously added' do
    let(:rick) { create(:user) }

    it 'displays all the information entered by user' do
    login_as rick
    visit '/profile/new'

    fill_in 'profile[firstname]', with: "John"
    fill_in 'profile[lastname]', with: "Smith"
    fill_in 'profile[dob]', with: "28-04-1988"
    fill_in 'profile[contactnr]', with: "01722111222"
    fill_in 'profile[address1]', with: "15"
    fill_in 'profile[address2]', with: "A road"
    fill_in 'profile[town]', with: "London"
    fill_in 'profile[county]', with: "Sussex"
    select("United Kingdom", :from => "profile_country")
    fill_in 'profile[postcode]', with: "sw14g"
    select("Male", :from => "profile_gender")

    click_button 'Create Profile'      

    expect(current_path).to eq "/profile/edit"
    expect(find_field('profile[town]').value).to eq 'London'
    expect(find_field('profile_gender').value).to eq 'Male'
    expect(find_field('profile_country').value).to eq 'United Kingdom'
    end

    context 'editing profile' do 
      before do
        login_as rick
        create(:profile, user: rick)
      end

      it 'should update the profile' do 
        visit '/profile/edit'
        fill_in 'profile[lastname]', with: 'Brown'

        click_button 'Update Profile'
        expect(current_path).to eq "/profile/edit"
        find_field('profile_lastname').value.should eq 'Brown'
      end
    end

    context 'assigning UUID to User table' do
      it 'adds uuid to User table if table is currently nil' do
        user = User.find(rick)
        expect(user.uuid).to eq nil
      end
    end

  end
end