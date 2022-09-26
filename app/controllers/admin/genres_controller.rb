class Admin::GenresController < ApplicationController

  def index
    @genre = Genre.new
    @genres= Genre.all
  end

  def create
    genre = Genre.new(genre_params)
    if genre.save
      flash[:notice] = "ジャンルを追加しました。"
      redirect_to '/admin/genres'
    else
      flash[:notice] = "ジャンルを追加できませんでした。"
      redirect_to '/admin/genres'
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    genre = Genre.find(params[:id])
    if genre.update
      flash[:notice] = "ジャンル情報を変更しました。"
      redirect_to 'admin/genres'
    else
      flash[:notice] = "ジャンル情報を変更できませんでした。"
      render action :edit
    end
  end

  def destroy
     @genre = Genre.find(params[:id])
     if @genre.destroy
       redirect_to admin_genres_path
     end
  end

  protected

  def genre_params
    params.require(:genre).permit(:name)
  end
end
