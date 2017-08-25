class ApplicationController < ActionController::Base
  #protect_from_forgery with: :exception

  helper_method :current_user #this gives access to whole current_user method,  not just the instance variable at the end

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def logged_in?
    !current_user.nil?
  end

  def already_logged_in
    redirect_to cats_url if logged_in?
  end
end
