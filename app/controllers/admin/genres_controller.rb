class Admin::GenresController < ApplicationController

  def index
    @genre = Genre.new
    @genres= Genre.all
  end

  def create
    genre = Genre.new(genre_params)
    if genre.save
      redirect_to '/admin/genres'
    else
      render action :new
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    genre = Genre.find(params[:id])
    if genre.update
      redirect_to 'admin/genres'
    else
      render action :edit
    end
  end

  def destroy
     @genre = Genre.find(params[:id])
     if @genre.delete
       redirect_to admin_genres_path
     end
  end

  protected

  def genre_params
    params.require(:genre).permit(:name)
  end
end
