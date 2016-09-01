require 'rails_helper'

RSpec.describe "employment_centers/show", type: :view do
  before(:each) do
    @employment_center = assign(:employment_center, EmploymentCenter.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
