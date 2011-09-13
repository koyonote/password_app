require 'spec_helper'
describe GroupsController do
  describe 'POST create' do
    fixtures :users
    let(:group) { mock_model(Group).as_null_object }

    before do
      Group.stub(:new).and_return(group)
      session[:user_id] = users(:one).id
    end

    it "creates a new group" do
      Group.should_receive(:new).with("name" => "foo").and_return(group)
      post :create, :group => {"name" => "foo"}
    end

    context "when the group saves successfully" do
      it "sets a flash[:notice] message" do
        post :create
        flash[:notice].should eq("Group was successfully created.")
      end

      it "redirects to the Group index" do
        post :create
        response.should redirect_to(:action => "index")
      end
    end

    context "when the group fails to save" do
      before do
        group.stub(:save).and_return(false)
      end

      it "assigns @group" do
        post :create
        assigns[:group].should eq(group)
      end

      it "renders new template" do
        post :create
        response.should render_template("new")
      end
    end
  end
end
