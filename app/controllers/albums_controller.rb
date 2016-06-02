class AlbumsController < ApplicationController

  def new
    @album = Album.new
    @band = Band.find(params[:band_id])
    render :new
  end

  def create
    @album = Album.new(album_params)
    @album.live = true if album_params[:live]

    if @album.save
      redirect_to bands_url
    else
      render :new
    end
  end

  def show
    @album = Album.includes(:tracks).find(params[:id])
    @track = Track.new
    render :show
  end

  def destroy
  end

  private
  def album_params
    params.require(:album).permit(:name, :band_id, :live)
  end
  
end
