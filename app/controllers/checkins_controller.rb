class CheckinsController < ApplicationController
  def index
    @checkins = Checkin.where(public: true).page(params[:page])

    render json: @checkins
  end
end
