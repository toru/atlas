class ApplicationController < ActionController::API
  before_action :set_locale

  rescue_from ActiveRecord::RecordNotFound do |exception|
    render json: '', status: :not_found
  end

  rescue_from ActionController::ParameterMissing do |exception|
    render json: '', status: :bad_request
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
end
