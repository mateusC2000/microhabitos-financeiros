require "rails_helper"

RSpec.describe FinancialGoalsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/financial_goals").to route_to("financial_goals#index")
    end

    it "routes to #new" do
      expect(get: "/financial_goals/new").to route_to("financial_goals#new")
    end

    it "routes to #show" do
      expect(get: "/financial_goals/1").to route_to("financial_goals#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/financial_goals/1/edit").to route_to("financial_goals#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/financial_goals").to route_to("financial_goals#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/financial_goals/1").to route_to("financial_goals#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/financial_goals/1").to route_to("financial_goals#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/financial_goals/1").to route_to("financial_goals#destroy", id: "1")
    end
  end
end
