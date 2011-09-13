require 'spec_helper'
describe FoldersController do
  describe 'POST create' do
    fixtures :users
    let(:folder) { mock_model(Folder).as_null_object }

    before do
      Folder.stub(:new).and_return(folder)
      session[:user_id] = users(:one).id
    end

    it "creates a new folder" do
      Folder.should_receive(:new).with("name" => "foo").and_return(folder)
      post :create, :folder => {"name" => "foo"}
    end
  end
end
