class PlacesController < ApplicationController
  def index
    @places = Place.includes(:place_content).page(params[:page])

    render json: @places.to_json(methods: %i(name))
  end

  def show
    @place = Place.find_by!(alternate_id: params[:id])

    render json: @place.to_json(methods: %i(name))
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
    @place = Place.find_by!(alternate_id: params[:id])

    @place.assign_attributes place_params

    if @place.invalid?
      render json: @place.errors, status: :bad_request
      return
    end

    @place.save!

    render json: @place.to_json(methods: %i(name))
  end

  def destroy
    @place = Place.find_by!(alternate_id: params[:id])
    @place.destroy

    render json: nil
  end

  private

  def place_params
    params.permit %i(name)
  end
end
