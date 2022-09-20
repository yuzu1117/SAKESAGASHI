class User::ItemsController < ApplicationController

  def search
    @items = Item.search(params[:keyword])
    @keyword = params[:keyword]
    @genres = Genre.all
  end

  def index
    keyword = params[:keyword]
    @items = Item.where("name LIKE(?)", "%#{keyword}%")
    if params[:genre_id]
       @genre = Genre.find(params[:genre_id])
       @items = @genre.items.all
    end
  end

  def show
    @item = Item.find(params[:id])
    @reviews = @item.reviews.all
    @average = @item.reviews.average(:star)
    #味の平均値
    @ave_sharpness = @reviews.average(:sharpness)
    @ave_rich = @reviews.average(:rich)
    @ave_sourness = @reviews.average(:sourness)
    @ave_sweetness = @reviews.average(:sweetness)
    @ave_bitterness = @reviews.average(:bitterness)
  end

 protected

  def item_params
    params.require(:item).permit(:image, :name, :maker, :release_date, :genre_id)
  end

end
