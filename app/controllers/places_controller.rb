class PlacesController < ApplicationController
  def create
    place_params
  end

  private

  def place_params
    params.permit %i(name)
  end
end
