require 'spec_helper'

describe Item do
  before do
    @item = Item.new(
      :name => "foo",
      :password => "bar",
      :folder => mock_model(Folder)
    )
  end

  it "is valid with valid attributes" do
    @item.should be_valid
  end

  it "is not valid without a name" do
    @item.name = nil
    @item.should_not be_valid
  end

  it "is not valid without a folder" do
    @item.folder = nil
    @item.should_not be_valid
  end

  it "should have a sugar" do
    lambda {
      @item.save
    }.should change(Sugar, :count).by(1)
  end
end
