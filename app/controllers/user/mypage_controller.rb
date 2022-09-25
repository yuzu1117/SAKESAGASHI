class User::MypageController < ApplicationController

  before_action :set_current_user
  before_action :authenticate_user!
  before_action :ensure_guest_user, only: [:edit]

  def show
    @reviews = @user.reviews.all
    @review_comments =@user.review_comment.all
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "会員情報が変更されました。"
      redirect_to user_mypage_path(user.id)
    else
      render :edit
    end
  end

#退会用
  def withdrawal
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    @user.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会を実行いたしました。ご利用ありがとうございました。"
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :nickname, :email,:is_deleted)
  end

  def set_current_user
    @user = current_user
  end

  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.name == "guestuser"
      flash[:notice] = 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
      redirect_to root_path
    end
  end

end

