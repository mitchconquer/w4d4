class BandsController < ApplicationController

  def index
    @bands = Band.all.includes(:albums).order(:name)
    render :index
  end

  def new
    @band = Band.new
    render :new
  end

  def create
    @band = Band.new(band_params)

    if @band.save
      redirect_to bands_url
    else
      render :new
    end
  end

  def show
  end

  def destroy
  end

  private
  def band_params
    params.require(:band).permit(:name)
  end
end
