class CheckinsController < ApplicationController
  def index
    @checkins = Checkin.where(is_public: true)
                       .order(created_at: :desc)
                       .page(params[:page])

    @checkins = pretty_format(@checkins) if params[:pp] == '1'

    render json: @checkins
  end

  def show
    @checkin = Checkin.where(is_public: true).find(params[:id])

    render json: @checkin
  end

  def create
    return render_400(msg: 'place_id required') unless params[:place_id]

    @place   = Place.find_by! external_id: params[:place_id]
    @checkin = Checkin.new place: @place
    @checkin.show_time = params[:show_time] == '1'

    if @checkin.invalid?
      render json: @checkin.errors, status: :bad_request
      return
    end

    @checkin.save!

    render json: @checkin
  end

  def update
    @checkin = Checkin.find params[:id]
    @checkin.update! checkin_params

    render json: @checkin
  end

  private

  def checkin_params
    params.permit(:is_public, :comment)
  end
end
