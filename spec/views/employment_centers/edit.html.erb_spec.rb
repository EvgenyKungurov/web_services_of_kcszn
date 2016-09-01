require 'rails_helper'

RSpec.describe "employment_centers/edit", type: :view do
  before(:each) do
    @employment_center = assign(:employment_center, EmploymentCenter.create!())
  end

  it "renders the edit employment_center form" do
    render

    assert_select "form[action=?][method=?]", employment_center_path(@employment_center), "post" do
    end
  end
end
