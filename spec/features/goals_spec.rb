require 'spec_helper'

describe "goal" do

  subject { page }
  let(:user) {FactoryGirl.create(:user)}

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
      it { should have_content 'Title' }
      it { should have_content 'Plan' }
      it { should have_content 'Public' }
      it { should have_content 'Private' }
      it { should have_content 'Completed' }
    end

    describe "completed form" do

      describe "invalid form" do
        before {click_button 'Add'}
        it { should have_content 'Add A Goal' }
        it { should have_content 'Title can\'t be blank' }
        it { should have_content 'Shared can\'t be blank' }
      end

      describe "valid form" do
        before do
          fill_in 'Title', with: 'Lose five pounds'
          fill_in 'Plan', with: 'Eat less, exercise more'
          choose 'Public'
          choose 'Yes'
          click_button 'Add'
        end

        it { should_not have_content 'Add A Goal' }
        it { should_not have_content 'Title can\'t be blank' }
        it { should_not have_content 'Public can\'t be blank' }
        it { should have_content 'Lose five pounds' }
      end

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