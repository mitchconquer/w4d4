class NotesController < ApplicationController

  def new
    @note = Note.new
    render :new
  end

  def create
    @note = Note.new(note_params)
    if @note.save
      redirect_to album_url(@note.album.id)
    else
      redirect_to album_url(Track.find(note_params[:track_id]).album.id)
    end
  end

  private
  def note_params
    params.require(:note).permit(:track_id, :user_id, :body)
  end
end
