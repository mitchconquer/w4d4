class TracksController < ApplicationController
  def create
    @track = Track.new(track_params)

    if @track.save
      redirect_to album_url(track_params[:album_id])
    else
      @album = Album.find(track_params[:album_id])
      render template: "albums/show"
    end
  end

  private
  def track_params
    params.require(:track).permit(:name, :lyrics, :album_id, :bonus)
  end
end
