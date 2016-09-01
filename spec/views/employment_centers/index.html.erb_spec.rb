require 'rails_helper'

RSpec.describe "employment_centers/index", type: :view do
  before(:each) do
    assign(:employment_centers, [
      EmploymentCenter.create!(),
      EmploymentCenter.create!()
    ])
  end

  it "renders a list of employment_centers" do
    render
  end
end
