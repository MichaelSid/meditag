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
      create(:profile, user: @rick)

      @uuid = SecureRandom.uuid
      @qrpath = '/idverify/verify?tag-uuid=' + @uuid
      visit @qrpath
    end
  
    context 'new user visits from qrcode' do
      it 'should pass uuid to url parameters' do
        expect(full_current_path).to eq @qrpath
      end
    end
  end
  context 'check uuid against database' do
    it 'should show flash message if uuid not already assigned' do
      expect(page).to have_content 'UUID verified successfully'
    end

    it 'display flash message if uuid IS assigned to another user' do
      visit '/idverify/new'
      fill_in 'uuid-form', with: @uuid
      click_button 'Submit'

      expect(page).to have_content 'Something went wrong. Please try again'
    end
  end

  describe 'Verify validity of uuid' do

    context 'uuid is invalid' do
      it 'it is invalid if not 36 chars long' do
        visit '/idverify/verify?tag-uuid=1234'
        expect(page).to have_content 'Something went wrong. Please try again'
      end
    end

    context 'uuid is valid' do
      it 'displays a verification successful message' do
        expect(page).to have_content 'UUID verified successfully'
      end
    end
  end
end
