require 'spec_helper.rb'

describe "sign up" do
  it "redirect to homepage" do
    visit '/users/sign_up'
    fill_in 'Email', with: 'a@a.com'
    fill_in 'Password', with: '12345678'
    fill_in 'Password confirmation', with: '12345678'
    click_button 'Sign up'

    expect(current_path).to eq '/profile/new'
  end
end