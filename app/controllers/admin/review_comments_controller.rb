class Admin::ReviewCommentsController < ApplicationController

  def index
    @review_comments = ReviewComment.all.order(created_at: :desc)
  end

  def destroy
    review_comment = ReviewComment.find(params[:id])
    if review_comment.destroy
      flash[:notice] = "コメントを削除しました。"
      redirect_to admin_review_comments_path
    end
  end
end
