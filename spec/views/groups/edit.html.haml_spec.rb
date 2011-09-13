require 'spec_helper'

describe "groups/edit.html.haml" do
  before do
    assign(:group,
      mock_model(Group).as_new_record.as_null_object)
  end

  it "renders the edit group form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => groups_path(@group), :method => "post" do
      assert_select "input#group_name", :name => "group[name]"
    end
  end
end
