class TracksController < ApplicationController
  before_action only: [:show] do
    redirect_to new_session_url unless current_user
  end

  def create
    track = Track.new(band_params)
    track.save

    flash[:errors] = track.errors.full_messages unless track.save
    redirect_to :index
  end

  def destroy
    track = Track.find(:id)
    track.destroy
    redirect_to :index
  end

  def edit
    @track = Track.find(:id)
    redirect_to track_url(@track)
  end

  def show
    @track = Track.find(params[:id])
  end

  def update
    @track = Track.find(:id)
    unless @track.update(track_params)
     flash[:errors] = @track.errors.full_messages
    end
     redirect_to track_url(@track)
  end

  private
  def track_params
    params.require(:track).permit(:track_type, :lyric, :title)
  end
end
