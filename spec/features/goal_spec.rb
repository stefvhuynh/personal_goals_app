require 'spec_helper'

describe "goal" do

  subject(:user) {FactoryGirl.create(:user)}

  before do
    visit new_session_url
    fill_in 'Username', with: user.username
    fill_in 'Password', with: user.password
    click_button 'Log In'
  end

  feature "add a goal" do

    before do
      visit new_goal_url
    end

    describe "form fields" do

      it "has a title field" do
      end

      it "has a plan field" do
      end

      it "has a public field" do
      end

      it "has a completed field" do
      end

    end

    describe "completed form" do
    end

  end

  feature "edit a goal" do
  end

  feature "show all users' goals" do
  end

  feature "show user's goals" do
  end

  feature "show a goal" do
  end

end