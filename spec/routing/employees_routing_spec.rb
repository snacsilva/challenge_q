require "rails_helper"

RSpec.describe EmployeesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "enterprises/1/employees").to route_to("employees#index", enterprise_id: "1")
    end

    it "routes to #show" do
      expect(get: "enterprises/1/employees/1").to route_to("employees#show", id: "1", enterprise_id: "1")
    end


    it "routes to #create" do
      expect(post: "enterprises/1/employees").to route_to("employees#create", enterprise_id: "1")
    end

    it "routes to #update via PUT" do
      expect(put: "enterprises/1/employees/1").to route_to("employees#update", id: "1", enterprise_id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "enterprises/1/employees/1").to route_to("employees#update", id: "1", enterprise_id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "enterprises/1/employees/1").to route_to("employees#destroy", id: "1", enterprise_id: "1")
    end
  end
end
