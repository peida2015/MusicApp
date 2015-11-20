class BandsController < ApplicationController
  before_action only: [:show] do
    redirect_to new_session_url unless current_user
  end

  def index
  end

  def new
  end

  def create
    band = Band.new(band_params)
    band.save

    flash[:errors] = band.errors.full_messages unless band.save
    redirect_to :index
  end

  def destroy
    band = Band.find(:id)
    band.destroy
    redirect_to :index
  end

  def edit
    @band = Band.find(:id)
    redirect_to band_url(@band)
  end

  def show
    @band = Band.find(params[:id])
  end

  def update
    @band = Band.find(:id)
    unless @band.update(band_params)
     flash[:errors] = @band.errors.full_messages
    end
     redirect_to band_url(@band)
  end

  private
  def band_params
    params.require(:band).permit(:name, :id)
  end
end
