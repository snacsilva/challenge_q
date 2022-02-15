require "rails_helper"

RSpec.describe LeadersController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "enterprises/1/leaders").to route_to("leaders#index", enterprise_id: "1")
    end

    it "routes to #show" do
      expect(get: "enterprises/1/leaders/1").to route_to("leaders#show", id: "1", enterprise_id: "1")
    end


    it "routes to #create" do
      expect(post: "enterprises/1/leaders").to route_to("leaders#create", enterprise_id: "1")
    end

    it "routes to #update via PUT" do
      expect(put: "enterprises/1/leaders/1").to route_to("leaders#update", id: "1", enterprise_id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "enterprises/1/leaders/1").to route_to("leaders#update", id: "1", enterprise_id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "enterprises/1/leaders/1").to route_to("leaders#destroy", id: "1", enterprise_id: "1")
    end
  end
end
