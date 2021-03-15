class TimeTrackingsController < ApplicationController
  before_action :set_time_tracking, only: [:show, :update, :destroy]

  # GET /time_trackings
  def index
    @time_trackings = TimeTracking.all

    render json: @time_trackings
  end

  # GET /time_trackings/1
  def show
    render json: @time_tracking
  end

  # POST /time_trackings
  def create
    @time_tracking = TimeTracking.new(time_tracking_params)

    if @time_tracking.save
      render json: @time_tracking, status: :created, location: @time_tracking
    else
      render json: @time_tracking.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /time_trackings/1
  def update
    if @time_tracking.update(time_tracking_params)
      render json: @time_tracking
    else
      render json: @time_tracking.errors, status: :unprocessable_entity
    end
  end

  # DELETE /time_trackings/1
  def destroy
    @time_tracking.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_time_tracking
      @time_tracking = TimeTracking.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def time_tracking_params
      params.require(:time_tracking).permit(:start_at, :end_at, :user_id)
    end
end
