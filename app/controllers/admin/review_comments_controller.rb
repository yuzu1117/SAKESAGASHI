class Admin::ReviewCommentsController < ApplicationController

  def index
    @review_comments = ReviewComment.all
  end

  def destroy
    review_comment = ReviewComment.find(params[:id])
    review_comment.delete
    flash[:notice] = "コメントを削除しました。"
    redirect_to admin_reviews_path
  end
end
