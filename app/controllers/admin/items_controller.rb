class Admin::ItemsController < ApplicationController

  def new
    @item = Item.new
  end

  def create
    item = Item.new(item_params)
    if item.save
      flash[:notice] = "商品が登録されました。"
      redirect_to admin_items_path
    else
      flash[:notice] = "商品が登録できませんでした。"
      render action: :new
    end
  end

  def index
    @items = Item.all
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    if item.update(item_params)
      flash[:notice] = "商品情報を変更しました。"
      redirect_to admin_items_path
    else
      flash[:notice] = "商品情報を変更できませんでした。"
      render action: :edit
    end
  end

  def destroy
    @item = Item.find(params[:id])
    if @item.delete
      flash[:notice] = "商品を削除しました。"
      redirect_to admin_items_path
    else
      flash[:notice] = "商品を削除できませんでした。"
      render admin_item_path(item.id)
    end
  end

  protected

  def item_params
    params.require(:item).permit(:image, :name, :maker, :release_date, :genre_id)
  end
end
