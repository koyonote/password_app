class FoldersController < ApplicationController
  skip_before_filter :require_session
  before_filter :require_login
  before_filter :exclude_employees, :only => [:new, :edit, :destroy]
  def require_login
    unless session[:user_id]
      redirect_to(login_url)
    end
  end

  def index
    @folders = User.find(session[:user_id]).get_folders
    unless @folders
      @folders = []
    end
  end

  def show
    @folder = User.find(session[:user_id]).get_folder(params[:id])
    unless @folder
      redirect_to(:action => "index")
    end
  end

  def new
    @folder = Folder.new
  end

  def edit
    @folder = Folder.find(params[:id])
  end

  def create
    @folder = Folder.new(params[:folder])

    if @folder.save
      redirect_to folders_url
    else
      render :action => "new"
    end
  end

  def update
    params[:folder][:group_ids] ||= []
    params[:folder][:user_ids] ||= []
    @folder = Folder.find(params[:id])

    if @folder.update_attributes(params[:folder])
      redirect_to folders_url
    else
      render :action => "edit"
    end
  end

  def destroy
    @folder = Folder.find(params[:id])
    @folder.deleted = true

    if @folder.save
      redirect_to(folders_url)
    end
  end
end
