class User::ItemsController < ApplicationController

  def search
    @items = Item.search(params[:keyword])
    @keyword = params[:keyword]
    @genres = Genre.all
    #ランキングから探すメソッド
    @ranks = Item.find(Review.group(:item_id).order('avg(star) desc').limit(3).pluck(:item_id))
  end

  def index
    keyword = params[:keyword]
    @items = Item.where("name LIKE(?)", "%#{keyword}%")
    #ジャンル検索
    if params[:genre_id]
       @genre = Genre.find(params[:genre_id])
       @items = @genre.items.all
    end
  end

  def show
    @item = Item.find(params[:id])
    @reviews = @item.reviews.all
    if @reviews != []
      #星の平均値を出すメソッド
      @average = @item.reviews.average(:star).round(2)
      #味の平均値を出すメソッド
      @ave_sharpness = @reviews.average(:sharpness).round(2)
      @ave_rich = @reviews.average(:rich).round(2)
      @ave_sourness = @reviews.average(:sourness).round(2)
      @ave_sweetness = @reviews.average(:sweetness).round(2)
      @ave_bitterness = @reviews.average(:bitterness).round(2)
    end
  end

 protected

  def item_params
    params.require(:item).permit(:image, :name, :maker, :release_date, :genre_id)
  end

end
