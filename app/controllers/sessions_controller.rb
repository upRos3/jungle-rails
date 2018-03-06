class SessionsController < ApplicationController
  def new
  end

  def create
    if user = User.authenticate_with_credentials(params[:email], params[:password])
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/login'
      flash[:alert] = "Email and password field do not match"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end


end
