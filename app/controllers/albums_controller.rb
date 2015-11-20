class AlbumsController < ApplicationController
  def new

  end

  def create
    album = Album.new(album_params)
    album.save

    flash[:errors] = album.errors.full_messages unless band.save
    redirect_to :index
  end

  def destroy
    album = Album.find(:id)
    album.destroy
    redirect_to :index
  end

  def edit
    @album = album.find(:id)
    redirect_to album_url(@band)
  end

  def show
    @album = Album.find(params[:id])
  end

  def update
    @album = Album.find(:id)
    unless @album.update(album_params)
     flash[:errors] = @album.errors.full_messages
    end
     redirect_to album_url(@album)
  end

  private

  def album_params
    params.require(:album).permit(:album_type, :title)
  end
end
