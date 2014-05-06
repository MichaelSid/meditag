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
      @rick = create(:user)
      login_as @rick
      create(:profile, user: @rick)
    end

  it 'assigns valid uuid to a logged in user' do
    tag_uuid = SecureRandom.uuid
    visit '/idverify/verify?tag-uuid=' + tag_uuid
    expect(@rick.reload.uuid).to eq tag_uuid
  end

  context 'user already has a valid uuid associated' do
      it 'displays a message if account already has a uuid associated' do
        visit '/idverify/verify?tag-uuid=' + SecureRandom.uuid
        visit '/idverify/verify?tag-uuid=' + SecureRandom.uuid
        visit new_idverify_path
        expect(page).to have_content "Account already has a tag associated."
      end

      it 'displays a message if account does not have uuid associated' do
        visit new_idverify_path
        expect(page).to have_content "No tag associated with this account"
      end
    end
end

end