class PlacesController < ApplicationController
  def create
    place_params
  end

  private

  def place_params
    params.require %i(name)
  end
end
