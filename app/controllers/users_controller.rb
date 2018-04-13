class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    if !User.find_by(email: params[:user][:email])
      binding.pry
      user = User.create(user_params)
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash[:warning] = "User already exists, please sign in instead"
      redirect_to root_path
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
