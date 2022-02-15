require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/employees", type: :request do
  # This should return the minimal set of attributes required to create a valid
  # Employee. As you add validations to Employee, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { create(:employee, enterprise_id: enterprise.id).attributes.symbolize_keys }

  let(:enterprise) { create(:enterprise)  }

  let(:invalid_attributes) {
    {
      name: 'Joker',
      birth_date: '10/10/10'
    }
  }

  # This should return the minimal set of values that should be in the headers
  # in order to pass any filters (e.g. authentication) defined in
  # EmployeesController, or in your router and rack
  # middleware. Be sure to keep this updated too.
  let(:valid_headers) {
    {}
  }

  describe "GET /index" do
    it "renders a successful response" do
      Employee.create valid_attributes
      get enterprise_employees_path(enterprise.id), headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      employee = Employee.create valid_attributes
      get enterprise_employees_url(employee), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Employee" do
        expect {
          post enterprise_employees_path(enterprise.id),
               params: { employee: valid_attributes }, headers: valid_headers, as: :json
        }.to change(Employee, :count).by(1)
      end

      it "renders a JSON response with the new employee" do
        post enterprise_employees_path(enterprise.id),
             params: { employee: valid_attributes }, headers: valid_headers, as: :json
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Employee" do
        expect {
          post enterprise_employees_path(enterprise.id),
               params: { employee: invalid_attributes }, as: :json
        }.to change(Employee, :count).by(0)
      end

      it "renders a JSON response with errors for the new employee" do
        post enterprise_employees_path(enterprise.id),
             params: { employee: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        create(:employee, enterprise_id: enterprise.id).attributes.symbolize_keys
      }

      it "updates the requested employee" do
        employee = Employee.create valid_attributes
        patch enterprise_employee_path(enterprise.id, employee),
              params: { employee: new_attributes }, headers: valid_headers, as: :json
        employee.reload
        skip("Add assertions for updated state")
      end

      it "renders a JSON response with the employee" do
        employee = Employee.create valid_attributes
        patch enterprise_employee_path(enterprise.id, employee),
              params: { employee: new_attributes }, headers: valid_headers, as: :json
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the employee" do
        employee = Employee.create valid_attributes
        patch enterprise_employee_path(enterprise.id, employee),
              params: { employee: invalid_attributes }, headers: valid_headers, as: :json
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested employee" do
      employee = Employee.create valid_attributes
      expect {
        delete enterprise_employee_path(enterprise.id, employee), headers: valid_headers, as: :json
      }.to change(Employee, :count).by(-1)
    end
  end
end
