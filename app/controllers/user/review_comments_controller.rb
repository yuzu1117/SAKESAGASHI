class User::ReviewCommentsController < ApplicationController

  def create
    review = Review.find(params[:review_id])
    review_comment = current_user.review_comment.new(review_comment_params)
    review_comment.review_id = review.id
    review_comment.save
    redirect_to user_item_review_path(review.item.id,review.id)
  end

  private

  def review_comment_params
    params.require(:review_comment).permit(:comment)
  end

end
