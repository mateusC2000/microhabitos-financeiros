require 'rails_helper'

RSpec.describe "financial_goals/new", type: :view do
  before(:each) do
    assign(:financial_goal, FinancialGoal.new(
      title: "MyString",
      description: "MyText",
      target_value: "9.99",
      user_id: 1
    ))
  end

  it "renders new financial_goal form" do
    render

    assert_select "form[action=?][method=?]", financial_goals_path, "post" do

      assert_select "input[name=?]", "financial_goal[title]"

      assert_select "textarea[name=?]", "financial_goal[description]"

      assert_select "input[name=?]", "financial_goal[target_value]"

      assert_select "input[name=?]", "financial_goal[user_id]"
    end
  end
end
