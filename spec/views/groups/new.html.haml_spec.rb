require 'spec_helper'

describe "groups/new.html.haml" do
  before do
    assign(:group,
      mock_model(Group).as_new_record.as_null_object)
  end

  it "renders new group form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => groups_path, :method => "post" do
      assert_select "input#group_name", :name => "group[name]"
    end
  end
end
