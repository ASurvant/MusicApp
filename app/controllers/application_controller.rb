class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    return nil if session[:session_token].nil?
    @user ||= User.find_by_session_token(session[:session_token])
  end

  def logged_in?
    return true if @user == @user.current_user
    false
  end

  def log_in_user!(user)
    @user = user
    session[:session_token] = user.session_token
  end
end
