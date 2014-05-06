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
        visit @qrpath
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
        user.save
        visit @qrpath
        expect(page).to have_content 'Something went wrong. Please try again'
      end
    end

  end

  describe 'Verify validity of uuid' do

    before do
      @rick = create(:user)
      login_as @rick
      @uuid = SecureRandom.uuid
      visit '/idverify/verify?tag-uuid=' + @uuid
    end

    context 'uuid is invalid' do
      it 'it is invalid if not 36 chars long' do
        visit '/idverify/verify?tag-uuid=1234'
        expect(page).to have_content 'Something went wrong. Please try again'
      end
    end

    context 'uuid is valid' do
      it 'displays a verification successful message' do
        @uuid2 = SecureRandom.uuid
        visit '/idverify/new'
        fill_in 'uuid-form', with: @uuid2
        click_button 'Submit'
        expect(page).to have_content 'UUID verified successfully'
      end
    end

  end

end
