class CategoriesController < ApplicationController
  def index
    @categories = Category.page(params[:page])

    render json: @categories
  end
end
