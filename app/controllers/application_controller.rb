class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :signed_in?, :current_user

  def signin_user(user)
    @current_user = user
    session[:user_id] = user.id
  end

  def current_user
    return nil unless session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end

  def signed_in?
    !!current_user
  end


end
