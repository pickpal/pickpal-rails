require 'rails_helper'

describe "reddit authentication", type: :feature do
  it "signs in with valid credentials" do
    visit '/'
    click_link "Login with Reddit"
    expect(page).to have_content("mockreddituser")
    expect(page).to have_content("Log out")
  end

  it "handles authentication error" do
    OmniAuth.config.mock_auth[:reddit] = :invalid_credentials
    visit '/'
    click_link "Login with Reddit"
    expect(page).to have_content("authentication failed")
  end
end
