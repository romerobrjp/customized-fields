require "rails_helper"

describe "User signs in", type: :feature do
  before :each do
    user = create(:user)
  end

  scenario "with valid email and password" do
    sign_in_with 'romero.mfm@gmail.com', '123123'

    expect(page.current_path).to eql(contacts_path)
    expect(page).to have_content "Hi, romero.mfm@gmail.com"
    expect(page).to have_content "Signed in successfully."
  end

  scenario "with invalid email and password" do
    sign_in_with 'romero.mfm@gmail.com', 'aaaaaa'
    expect(page).to have_content "Invalid Email or password."
  end

  def sign_in_with(email, password)
    visit root_url

    expect(page.current_path).to eql(new_user_session_path)
    expect(page).to have_content('Log in')

    fill_in 'user_email', with: email
    fill_in 'user_password', with: password
    click_button 'Log in'
  end
end
