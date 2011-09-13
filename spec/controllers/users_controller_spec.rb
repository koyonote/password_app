require 'spec_helper'
describe UsersController do
  describe 'POST create' do
    fixtures :users
    let(:user) { mock_model(User).as_null_object }

    before do
      User.stub(:new).and_return(user)
      session[:user_id] = users(:one).id
    end

    context "when the user saves successfully" do
      it "redirects to the User index" do
        post :create
        response.should redirect_to(:action => "index")
      end
    end

    context "when the user fails to save" do
      before do
        user.stub(:save).and_return(false)
      end

      it "assigns @user" do
        post :create
        assigns[:user].should eq(user)
      end

      it "renders new template" do
        post :create
        response.should render_template("new")
      end
    end
  end
end
