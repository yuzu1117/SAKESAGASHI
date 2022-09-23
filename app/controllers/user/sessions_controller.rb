# frozen_string_literal: true

class User::SessionsController < Devise::SessionsController

  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to root_path
  end

 protected

  def reject_customer
    @user= User.find(params[:id])
      if @user
        if @user.valid_password?(params[:customer][:password]) &&  (@user.active_for_authentication? == true)
        redirect_to new_user_registration
        end
      end
  end

  protected
# 退会しているかを判断するメソッド
  def user_state
    ## 【処理内容1】 入力されたemailからアカウントを1件取得
    @user = User.find_by(email: params[:customer][:email])
    ## アカウントを取得できなかった場合、このメソッドを終了する
    return if !@user
    ## 【処理内容2】 取得したアカウントのパスワードと入力されたパスワードが一致してるかを判別
    if @user.valid_password?(params[:customer][:password])
      ## 【処理内容3】
      if @user.is_deleted
        redirect_to "/users/sign_up"
      end
    end
  end

  def reject_user
  @user = User.find_by(name: params[:user][:name])
  if @user
    if @user.valid_password?(params[:user][:password]) && (@user.is_deleted == false)
      flash[:notice] = "退会済みです。再度ご登録をしてご利用ください。"
      redirect_to new_user_registration_path
    else
      flash[:notice] = "項目を入力してください"
    end
  end
  end

end
