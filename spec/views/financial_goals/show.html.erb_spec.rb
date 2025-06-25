require 'rails_helper'

RSpec.describe "financial_goals/show", type: :view do
  before(:each) do
    assign(:financial_goal, create(:financial_goal,
      title: "Title",
      description: "MyText",
      target_value: "9.99",
      user_id: 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/2/)
  end
end
