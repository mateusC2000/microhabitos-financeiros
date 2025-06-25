require 'rails_helper'

RSpec.describe "financial_goals/edit", type: :view do
  let(:financial_goal) { create(:financial_goal) }

  before(:each) do
    assign(:financial_goal, financial_goal)
  end

  it "renders the edit financial_goal form" do
    render

    assert_select "form[action=?][method=?]", financial_goal_path(financial_goal), "post" do
      assert_select "input[name=?]", "financial_goal[title]"

      assert_select "textarea[name=?]", "financial_goal[description]"

      assert_select "input[name=?]", "financial_goal[target_value]"

      assert_select "input[name=?]", "financial_goal[user_id]"
    end
  end
end
