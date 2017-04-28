class PlacesController < ApplicationController
  def index
    @places = Place.includes(:place_content).page(params[:page])
    @places = pretty_format(@places) if params[:pp] == '1'

    render json: @places
  end

  def show
    @place = Place.find_by!(external_id: params[:id])

    render json: @place
  end

  def create
    @place = Place.new place_params

    if @place.invalid?
      render json: @place.errors, status: :bad_request
      return
    end

    @place.save!

    render json: @place
  end

  def update
    @place = Place.find_by!(external_id: params[:id])

    @place.assign_attributes place_params

    if @place.invalid?
      render json: @place.errors, status: :bad_request
      return
    end

    @place.save!

    render json: @place
  end

  def destroy
    @place = Place.find_by!(external_id: params[:id])
    @place.destroy

    render json: nil
  end

  private

  def place_params
    params.permit %i(name)
  end
end
