require 'spec_helper'

describe User do
  before do
    @user = User.new(
      :login => "foo",
      :password => "hoge",
      :password_confirmation => "hoge",
      :name => "bar",
    )
  end

  it "is valid with valid attributes" do
    @user.should be_valid
  end

  it "is not valid without a login" do
    @user.login = nil
    @user.should_not be_valid
  end

  it "is not valid without a name" do
    @user.name = nil
    @user.should_not be_valid
  end

  it "is not valid if login is not unique" do
    @user.save
    @user2 = User.new(
      :login => "foo",
      :password => "hoge",
      :password_confirmation => "hoge",
      :name => "bar",
    )
    @user2.should_not be_valid
  end

  it "is not valid without a password" do
    @user.password = nil
    @user.should_not be_valid
  end

  it "is not valid when confirmation is invalid" do
    @user.password_confirmation = "hogehoge"
    @user.should_not be_valid
  end

  describe "when a user is created" do
    it "should have a valid hashed_password" do
      @user.save
      @user.hashed_password.should be_true
    end
  end
end
