class Admin::ItemsController < ApplicationController

  def new
    @item = Item.new
  end

  def create
    item = Item.new(item_params)
    if item.save
      redirect_to admin_items_path
    else
      render action: :new
    end
  end

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    if item.update(item_params)
      redirect_to admin_item_path(item.id)
    else
      render action: :edit
    end
  end

  def destroy
    @item = Item.find(params[:id])
    if @item.delete
      redirect_to admin_items_path
    else
      render admin_item_path(item.id)
    end
  end

  protected

  def item_params
    params.require(:item).permit(:image, :name, :maker, :release_date, :genre_id)
  end
end