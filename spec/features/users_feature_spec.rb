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
end