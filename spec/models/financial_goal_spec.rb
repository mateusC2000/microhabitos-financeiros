require 'rails_helper'

RSpec.describe FinancialGoal, type: :model do
  it "is valid with valid attributes" do
    goal = build(:financial_goal)
    expect(goal).to be_valid
  end

  it "is invalid without a title" do
    goal = build(:financial_goal, title: nil)
    expect(goal).to be_invalid
  end

  it "is invalid with target_value <= 0" do
    goal = build(:financial_goal, target_value: 0)
    expect(goal).to be_invalid
  end
end
