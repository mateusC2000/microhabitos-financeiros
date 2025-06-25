require 'rails_helper'

RSpec.describe "/financial_goals", type: :request do
  let(:valid_attributes) {
    {
      title: "Guardar para viagem",
      description: "Economizar para viajar no final do ano",
      target_value: 3000.0,
      due_date: 1.month.from_now,
      user_id: 1
    }
  }

  let(:invalid_attributes) {
    {
      title: nil,
      description: nil,
      target_value: -100,
      due_date: nil,
      user_id: nil
    }
  }

  let(:new_attributes) {
    {
      title: "Meta atualizada",
      description: "Atualizando o objetivo",
      target_value: 5000.0,
      due_date: 2.months.from_now,
      user_id: 2
    }
  }

  describe "GET /index" do
    it "renders a successful response" do
      FinancialGoal.create! valid_attributes
      get financial_goals_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      financial_goal = FinancialGoal.create! valid_attributes
      get financial_goal_url(financial_goal)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_financial_goal_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      financial_goal = FinancialGoal.create! valid_attributes
      get edit_financial_goal_url(financial_goal)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new FinancialGoal" do
        expect {
          post financial_goals_url, params: { financial_goal: valid_attributes }
        }.to change(FinancialGoal, :count).by(1)
      end

      it "redirects to the created financial_goal" do
        post financial_goals_url, params: { financial_goal: valid_attributes }
        expect(response).to redirect_to(financial_goal_url(FinancialGoal.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new FinancialGoal" do
        expect {
          post financial_goals_url, params: { financial_goal: invalid_attributes }
        }.not_to change(FinancialGoal, :count)
      end

      it "renders a response with 422 status (unprocessable_entity)" do
        post financial_goals_url, params: { financial_goal: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      it "updates the requested financial_goal" do
        financial_goal = FinancialGoal.create! valid_attributes
        patch financial_goal_url(financial_goal), params: { financial_goal: new_attributes }
        financial_goal.reload
        expect(financial_goal.title).to eq("Meta atualizada")
        expect(financial_goal.target_value).to eq(5000.0)
        expect(financial_goal.user_id).to eq(2)
      end

      it "redirects to the financial_goal" do
        financial_goal = FinancialGoal.create! valid_attributes
        patch financial_goal_url(financial_goal), params: { financial_goal: new_attributes }
        expect(response).to redirect_to(financial_goal_url(financial_goal))
      end
    end

    context "with invalid parameters" do
      it "renders a response with 422 status (unprocessable_entity)" do
        financial_goal = FinancialGoal.create! valid_attributes
        patch financial_goal_url(financial_goal), params: { financial_goal: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested financial_goal" do
      financial_goal = FinancialGoal.create! valid_attributes
      expect {
        delete financial_goal_url(financial_goal)
      }.to change(FinancialGoal, :count).by(-1)
    end

    it "redirects to the financial_goals list" do
      financial_goal = FinancialGoal.create! valid_attributes
      delete financial_goal_url(financial_goal)
      expect(response).to redirect_to(financial_goals_url)
    end
  end
end
