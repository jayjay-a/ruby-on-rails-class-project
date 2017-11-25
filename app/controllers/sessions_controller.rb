class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_username(params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to channels_path, notice: "Logged in"
    else
      flash[:notice] = 'Invalid username or password'
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to channels_path, notice: "Logged out"
  end
end