require 'spec_helper'

describe "pledges/show" do
  before(:each) do
    @pledge = assign(:pledge, stub_model(Pledge))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
