class User::ReviewsController < ApplicationController

  def new
    @review = Review.new
    @item = @review.item
  end

  def create
    item = Item.find(params[:item_id])
    review = Review.new(review_params)
    @item = review.item
    review.item_id = item.id
    if review.save
      redirect_to user_item_path(@item.id)
    else
      render :new
    end
  end

  def index
    @item = Item.find(params[:item_id])
    @reviews = @item.reviews.all
  end

  private

  def review_params
    params.require(:review).permit(:item_id, :user_id, :content, :star, :created_at)
  end


end
