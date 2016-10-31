class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  private

  def current_user
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user
  end

  def logged_out?
    !current_user
  end

  def require_login
    redirect_to :root if logged_out?
  end

  def forbid_login
    redirect_to :root if logged_in?
  end

end
