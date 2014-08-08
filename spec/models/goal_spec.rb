require 'rails_helper'

RSpec.describe Goal, :type => :model do

  describe "model validations" do
    it "requires a title" do
      expect(FactoryGirl.build(:goal, title: "")).not_to be_valid
    end

    it "requires a shared value" do
      expect(FactoryGirl.build(:goal, shared: nil)).not_to be_valid
    end

    it "requires a completed value" do
      expect(FactoryGirl.build(:goal, completed: nil)).not_to be_valid
    end

    it "requires a user_id" do
      expect(FactoryGirl.build(:goal, user_id: nil)).not_to be_valid
    end
  end

end
