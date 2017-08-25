class SessionsController < ApplicationController

  #called interactive controller, theres no corresponding model, only interacts with
  #other models and controlelrs
  before_action :already_logged_in, only: [:new, :create]

  def new
    render :new #empty form to login
    #clicking submit will call create method below
  end

  def create #this is the login
    user = User.find_by_credentials(params[:user][:user_name], params[:user][:password])
    if user
       #method in the user model
      session[:session_token] = user.reset_session_token!
      redirect_to cats_url
      # fail
    else
      flash.now[:errors] ||= [] #convention, black magic
      flash.now[:errors] << 'username or password incorrect' #want to explicitly write message so as to not expose with the auot messages which is missing
      render :new
    end
  end

  def destroy
    @current_user = current_user #inheriting from the method we wrote in application controller
    if @current_user
      @current_user.reset_session_token! #user's session token, resets in the database
      session[:session_token] = nil #session's session token, this is the cookie deleted from the user's computer
      #user's session token and session's session token are different
      redirect_to cats_url
    end
  end
end
