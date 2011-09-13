class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :require_session
  helper_method :current_user

  private

  def require_session
    unless session[:user_id]
      redirect_to(login_url)
      false
    end
  end

  def admin_only
    unless User.find(session[:user_id]).role == 0
      redirect_to :action => "index"
    end
  end

  def exclude_employees
    if User.find(session[:user_id]).role == 2
      redirect_to :action => "index"
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
