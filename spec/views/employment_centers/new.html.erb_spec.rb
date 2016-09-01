require 'rails_helper'

RSpec.describe "employment_centers/new", type: :view do
  before(:each) do
    assign(:employment_center, EmploymentCenter.new())
  end

  it "renders new employment_center form" do
    render

    assert_select "form[action=?][method=?]", employment_centers_path, "post" do
    end
  end
end
