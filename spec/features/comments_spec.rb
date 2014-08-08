require 'spec_helper'

describe "comments" do
  subject { page }
  let(:user) { FactoryGirl.create(:user_with_goals) }
#  let(:goal) { FactoryGirl.create(:goal) }
  let(:visitor) { FactoryGirl.create(:user) }

  context "on user show page" do
    before do
      log_in(user)
      visit user_url(user)
      fill_in 'Comment', with: 'You go, girl!'
      click_button 'Publish'
      click_button 'Log Out'

      log_in(visitor)
      visit user_url(user)
    end

    it { should have_content user.username }
    it { should have_content 'You go, girl!'}
  end

  context "on goal show page" do
    before do
      log_in(visitor)
      visit user_goal_url(user, user.goals.first)
      fill_in 'Comment', with: 'You go, man!'
      click_button 'Publish'
      click_button 'Log Out'

      log_in(user)
      visit user_goal_url(user, user.goal)
    end

    it { should have_content user.goal.title }
    it { should have_content 'You go, man!' }
  end

end


