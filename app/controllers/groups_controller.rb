class GroupsController < ApplicationController
  before_filter :admin_only, :except => [:index, :show]

  def index
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
  end

  def new
    @group = Group.new
  end

  def edit
    @group = Group.find(params[:id])
  end

  def create
    @group = Group.new(params[:group])
    if @group.save
      redirect_to :action => "index"
    else
      render :action => "new"
    end
  end

  def update
    params[:group][:user_ids] ||= []
    @group = Group.find(params[:id])
    if @group.update_attributes(params[:group])
      redirect_to :action => "index"
    else
      render :action => "edit"
    end
  end

  def destroy
    @group = Group.find(params[:id])
    @group.deleted = true

    if @group.save
      redirect_to(groups_url)
    end
  end
end
