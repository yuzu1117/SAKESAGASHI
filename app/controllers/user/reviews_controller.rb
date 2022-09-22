class User::ReviewsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]

  def new
    @review = Review.new
    @item = @review.item
  end

  def create
    item = Item.find(params[:item_id])
    review = Review.new(review_params)
    review.user_id = current_user.id
    review.item_id = item.id
    if review.save
      flash[:notice] = "レビューが投稿されました。"
      redirect_to user_item_path(item.id)
    else
      render :new
    end
  end

  def index
    @item = Item.find(params[:item_id])
    @reviews = @item.reviews.all
  end

  def show
    @review = Review.find(params[:id])
    @review_comment = ReviewComment.new
  end


  private

  def review_params
    params.require(:review).permit(:item_id, :user_id, :content, :star,
    :sharpness,:rich, :sourness, :sweetness, :bitterness, :food, :situation,
    :created_at)
  end


end
