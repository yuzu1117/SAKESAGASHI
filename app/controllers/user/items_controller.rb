class User::ItemsController < ApplicationController

  def search
    @items = Item.search(params[:keyword])
  end

  def show
    @item = Item.find(params[:id])
    @review = Review.new
  end

 protected

  def item_params
    params.require(:item).permit(:image, :name, :maker, :release_date, :genre_id)
  end

end
