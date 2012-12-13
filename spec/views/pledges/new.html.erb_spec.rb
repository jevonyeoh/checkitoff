require 'spec_helper'

describe "pledges/new" do
  before(:each) do
    assign(:pledge, stub_model(Pledge).as_new_record)
  end

  it "renders new pledge form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => pledges_path, :method => "post" do
    end
  end
end
