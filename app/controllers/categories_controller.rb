class CategoriesController < ApplicationController
  def index
    @categories = Category.page(params[:page])

    render json: @categories
  end

  def show
    @category = Category.find_by!(slug: params[:id])

    render json: @category
  end

  def create
    @category = Category.new category_params

    if @category.invalid?
      render json: @category.errors, status: :bad_request
      return
    end

    @category.save!

    render json: @category
  end

  private

  def category_params
    params.permit %i(slug name)
  end
end
