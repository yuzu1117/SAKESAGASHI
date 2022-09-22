class Admin::UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
      redirect_to admin_users_path
    else
      render action: :edit
    end
  end

  protected

  def user_params
    params.require(:user).permit(:name, :nickname, :email,:is_deleted)
  end

end