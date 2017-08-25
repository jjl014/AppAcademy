class UsersController < ApplicationController

  before_action :already_logged_in

  def new
    render :new #all new does is render a form for the user to fill out
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:session_token] = @user.reset_session_token!
      redirect_to cats_url #the _url shit is only for redirect
    else #flash.now is a temp hash, that will be rendered via erros view
      flash.now[:errors] = @user.errors.full_messages
      #auto magic shit, whatever goes wrong creating the user, rails stores
      #it in the errors attribute of the user. We will push that to the flash
      #to be rendered
      #flash is always used with redirect_to
      #flash.now is always used with render
      render :new
    end

  end


  def user_params # whitelisting, should name it like this
    params.require(:user).permit(:user_name, :password) #infor submitted by user allowed in
    #just passing the :password key value here will trigger password_digest to be created
  end



end
