require 'spec_helper'

describe "pledges/edit" do
  before(:each) do
    @pledge = assign(:pledge, stub_model(Pledge))
  end

  it "renders the edit pledge form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => pledges_path(@pledge), :method => "post" do
    end
  end
end
