require 'spec_helper'

describe 'Uploading photos' do

let(:rick) { create(:user) }

	it 'displays the image on the post page' do
		
		login_as rick
		create(:profile, user: rick)
		visit '/profile/edit'
		attach_file 'profile_image', Rails.root.join('spec/images/cute-cat-wallpapers.jpg')
		click_button 'Update Profile'
		expect(page).to have_css '.uploaded-pic'
	end
end
