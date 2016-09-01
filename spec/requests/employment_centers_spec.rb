require 'rails_helper'

RSpec.describe "EmploymentCenters", type: :request do
  describe "GET /employment_centers" do
    it "works! (now write some real specs)" do
      get employment_centers_path
      expect(response).to have_http_status(200)
    end
  end
end
