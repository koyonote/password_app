class UsersController < ApplicationController
  before_filter :admin_only, :except => [:index, :show]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      redirect_to :action => "index"
    else
      render :action => "new"
    end
  end

  def update
    params[:user][:group_ids] ||= []
    @user = User.find(params[:id])

    if @user.update_attributes(params[:user])
      redirect_to :action => "index"
    else
      render :action => "edit"
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.deleted = true

    if @user.save
      redirect_to(users_url)
    end
  end
end
