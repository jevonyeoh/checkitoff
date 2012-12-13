require 'spec_helper'

describe "signing in" do
  it "requires all valid inputs" do
    visit new_user_session_path  
    fill_in "Email", with: "jevonyeoh@gmail.com"
    fill_in "Password", with: "codestone"
    click_button "Sign in"
    page.should have_content "Home"
  end
end




