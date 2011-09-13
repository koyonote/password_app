require 'spec_helper'

describe "groups/index.html.haml" do
  fixtures :users
  before(:each) do
    assign(:groups, [
      stub_model(Group,
        :name => "Name"
      ),
      stub_model(Group,
        :name => "Name"
      )
    ])
    session[:user_id] = users(:one).id
  end

  it "renders a list of groups" do
    pending
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
