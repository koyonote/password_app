require 'spec_helper'
describe ItemsController do
  describe 'POST create' do
    fixtures :users
    let(:item) { mock_model(Item).as_null_object }

    before do
      Item.stub(:new).and_return(item)
      session[:user_id] = users(:one).id
    end

    context "when the item saves successfully" do
      it "redirects to the Folder show" do
        post :create
        response.should redirect_to(item.folder)
      end

      it "sets a flash[:notice] message" do
        post :create
        flash[:notice].should eq("Item was successfully created.")
      end
    end

    context "when the item fails to save" do
      before do
        item.stub(:save).and_return(false)
      end

      it "assigns @user" do
        post :create
        assigns[:item].should eq(item)
      end

      it "renders new template" do
        post :create
        response.should render_template("new")
      end
    end
  end
end
