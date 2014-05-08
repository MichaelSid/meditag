require 'spec_helper.rb'

describe 'QRCode registration page' do

  context 'user visits page' do
    before do
      visit '/idverify/new'
    end

    it 'page should have register field' do
      expect(page).to have_content 'Register Tag Unique Identifier'
    end

    it 'should have a blank input field and a submit button' do
      find_field('Enter Tag Serial').value.should be_blank
    end
  end

  context 'user visits from sidebar link' do
    it 'link should lead to uuid validation page' do
      visit '/users/sign_in'
      click_link 'Register Tag'
      expect(full_current_path).to eq new_idverify_path
    end
  end

  describe 'Checking QRCode uuid against database' do
    
    before do
      @rick = create(:user)
      login_as @rick

      @uuid = SecureRandom.uuid
      @qrpath = '/idverify/verify?tag-uuid=' + @uuid
      visit @qrpath
    end
  
    context 'user visits from qrcode' do
      it 'redirects logged out user to registration' do
        logout :user
        visit '/idverify/verify?tag-uuid=' + SecureRandom.uuid
        expect(full_current_path).to eq new_user_registration_path
      end

      it 'redirects a logged in user to profile page' do
        expect(full_current_path).to eq edit_profile_path
      end
    end
  
    context 'check uuid against database' do
      it 'display flash message if uuid IS already assigned to a user' do
        visit '/idverify/new'
        user = User.find(@rick)
        user.uuid = @uuid.to_s
        visit @qrpath
        expect(page).to have_content 'Something went wrong. Please try again'
      end
    end
  end

  describe 'Verify validity of uuid' do

    before do
      @uuid = SecureRandom.uuid
      @rick = create(:user)
      login_as @rick
    end

    context 'uuid is invalid' do
      it 'it is invalid if not 36 chars long' do
        visit '/idverify/verify?tag-uuid=1234'
        expect(page).to have_content 'Something went wrong. Please try again'
      end
    end

    context 'if uuid is valid and user logged out' do
      it 'displays a verification successful message' do
        logout :user
        visit '/idverify/new'
        fill_in 'uuid-form', with: @uuid
        click_button 'Submit'
        expect(full_current_path).to eq new_user_registration_path
      end
    end

    context 'if uuid is valid and user logged in' do
      it 'displays a verification successful message and redirect to sign up' do
        logout :user
        visit '/idverify/new'
        fill_in 'uuid-form', with: @uuid
        click_button 'Submit'
        expect(full_current_path).to eq new_user_registration_path
      end
    end
  end
end
