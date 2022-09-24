class User::ReviewCommentsController < ApplicationController

  before_action :authenticate_user!

  def create
    review = Review.find(params[:review_id])
    review_comment = current_user.review_comment.new(review_comment_params)
    review_comment.review_id = review.id
    if review_comment.save
      flash[:notice] = "コメントが投稿されました。"
      redirect_to user_item_review_path(review.item.id,review.id)
    else
      flash[:notice] = "コメントが投稿できませんでした。"
      redirect_to user_item_review_path(review.item.id,review.id)
    end

  end

  protected

  def review_comment_params
    params.require(:review_comment).permit(:comment)
  end

end
