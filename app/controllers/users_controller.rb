class UsersController < ApplicationController
  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/signup'
      flash[:alert] = "Email already in use or password fields do not match"
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :surname, :email, :password, :password_confirmation)
  end
end
