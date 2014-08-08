require 'rails_helper'

RSpec.describe User, :type => :model do

  describe "model validations" do
    it "requires a username" do
      expect(FactoryGirl.build(:user, username: "")).not_to be_valid
    end

    it "requires a password longer than five characters" do
      expect(FactoryGirl.build(:user, password: "")).not_to be_valid
      expect(FactoryGirl.build(:user, password: "123")).not_to be_valid
      expect(FactoryGirl.build(:user, password: "123456")).to be_valid
    end
  end

  describe "auto-generated user attributes" do
    subject(:user) { FactoryGirl.create(:user) }

    it "has a non-nil password digest" do
      expect(user.password_digest).not_to be_nil
    end

    it "has a non-nil session token" do
      expect(user.session_token).not_to be_nil
    end
  end

end
