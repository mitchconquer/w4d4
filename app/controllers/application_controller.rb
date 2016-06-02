class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :require_login

  helper_method :current_user

  def current_user
    User.find_by(session_token: session[:session_token])
  end

  def login_user!(user)
    user.reset_session_token!
    session[:session_token] = user.session_token
  end

  def logout_user!(user)
    user.reset_session_token!
    session[:session_token] = nil
  end

  def require_login
    redirect_to login_url unless !!current_user
  end

end
