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
      @uuid = SecureRandom.uuid
      @qrpath = '/idverify/new?tag-uuid=' + @uuid
      visit @qrpath
    end
  
    context 'new user visits from qrcode' do
      it 'should pass uuid to url parameters' do
        expect(full_current_path).to eq @qrpath
      end
    end
  
    context 'check uuid against database' do
      it 'should show flash message if uuid already assigned' do
        expect(page).to have_content 'ID already assigned to user'
      end
    end
  end
end
