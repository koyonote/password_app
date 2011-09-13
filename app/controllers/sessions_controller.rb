# coding: utf-8
class SessionsController < ApplicationController
  skip_before_filter :require_session
  def new
  end

  def create
    user = User.authenticate(params[:login], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to root_url
    else
      flash.alert = "ログイン名かパスワードに誤りがあります"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_url
  end

end
