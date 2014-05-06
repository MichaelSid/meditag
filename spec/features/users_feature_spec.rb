require 'spec_helper.rb'

describe "sign up" do
  it "redirect to homepage" do
    visit '/users/sign_up'
    fill_in 'user_email', with: 'a@a.com'
    fill_in 'user_password', with: '12345678'
    fill_in 'user_password_confirmation', with: '12345678'
    click_button 'Sign Up'
    expect(current_path).to eq '/profile/new'
  end

describe 'assign uuid to user' do

  before do
      @tag_uuid = SecureRandom.uuid
      @rick = create(:user)
      login_as @rick
      create(:profile, user: @rick)
      visit '/idverify/verify?tag-uuid=' + @tag_uuid
    end

  it 'assigns valid uuid to a logged in user' do
    expect(@rick.reload.uuid).to eq @tag_uuid
  end
  
end

end