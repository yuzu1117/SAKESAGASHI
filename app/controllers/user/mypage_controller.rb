class User::MypageController < ApplicationController

  def show
    @user = User.find(params[:id])
    @reviews = @user.reviews.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
  end

  def withdrawal
    @user = User.find(params[:id])
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    @user.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会を実行いたしました。ご利用ありがとうございました。"
    redirect_to root_path
  end


end
