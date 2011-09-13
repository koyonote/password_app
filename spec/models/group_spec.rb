require 'spec_helper'

describe Group do
  before do
    @group = Group.new :name => "foo"
  end

  it "is not valid without a name" do
    @group.name = nil
    @group.should_not be_valid
  end

end
