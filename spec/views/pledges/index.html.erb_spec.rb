require 'spec_helper'

describe "pledges/index" do
  before(:each) do
    assign(:pledges, [
      stub_model(Pledge),
      stub_model(Pledge)
    ])
  end

  it "renders a list of pledges" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
