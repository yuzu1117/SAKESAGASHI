class Admin::ReviewsController < ApplicationController

  def index
    @reviews = Review.all.order(created_at: :desc)
  end

  def destroy
    review = Review.find(params[:id])
    if review.delete
      flash[:notice] = "レビューを削除しました。"
      redirect_to admin_reviews_path
    end
  end

end
