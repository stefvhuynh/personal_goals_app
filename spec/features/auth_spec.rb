require 'spec_helper'

feature "the signup process" do

  it "has a new user page" do
    visit new_user_url
    expect(page).to have_content "Sign Up"
  end

  feature "signing up a user" do
    context "with valid credentials" do
      it "shows username on the homepage after signup" do
        visit new_user_url
        fill_in 'Username', with: 'Gnarls'
        fill_in 'Password', with: 'Barkley'
        click_button 'Sign Up'

        expect(page).to have_content "Gnarls"
      end
    end

    context "with invalid credentials" do
      it "shows errors" do
        visit new_user_url
        click_button 'Sign Up'

        expect(page).to have_content "Username can't be blank"
        expect(page).to have_content "Password is too short"
      end
    end
  end
end

feature "logging in" do

  let(:user) { FactoryGirl.create(:user) }

  it "shows username on the homepage after login" do
    visit new_session_url
    fill_in 'Username', with: user.username
    fill_in 'Password', with: user.password
    click_button 'Log In'

    expect(page).to have_content user.username
  end
end

feature "logging out" do
  let(:user) { FactoryGirl.create(:user) }

  it "begins with logged out state" do
    visit root_url
    expect(page).to have_content 'Achievements'
    expect(page).to have_link 'Sign Up', href: new_user_url
    expect(page).to have_link 'Log In', href: new_session_url
    expect(page).not_to have_content 'Log Out'
  end

  it "doesn't show username on the homepage after logout" do
    visit new_session_url
    fill_in 'Username', with: user.username
    fill_in 'Password', with: user.password
    click_button 'Log In'
    click_button 'Log Out'

    expect(page).not_to have_content user.username
  end
end
