require 'rails_helper'

RSpec.describe "financial_goals/index", type: :view do
  before(:each) do
    assign(:financial_goals, [
      create(:financial_goal,
        title: "Title",
        description: "MyText",
        target_value: "9.99"
      ),
      create(:financial_goal,
        title: "Title",
        description: "MyText",
        target_value: "9.99"
      )
    ])
  end

  it "renders a list of financial_goals" do
    render
    cell_selector = 'div>p'

    assert_select cell_selector, text: /Title/, count: 2
    assert_select cell_selector, text: /MyText/, count: 2
    assert_select cell_selector, text: /9.99/, count: 2
  end
end
