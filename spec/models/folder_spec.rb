require 'spec_helper'

describe Folder do
  before do
    @folder = Folder.new :name => "foo"
  end

  it "is not valid without a name" do
    @folder.name = nil
    @folder.should_not be_valid
  end

  it "is not valid if name is not unique" do
    @folder.save
    folder = Folder.new :name => "foo"
    folder.should_not be_valid
  end
end
