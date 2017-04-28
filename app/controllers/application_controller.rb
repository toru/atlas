class ApplicationController < ActionController::API
  before_action :set_locale

  rescue_from ActiveRecord::RecordNotFound do |exception|
    render json: '', status: :not_found
  end

  rescue_from ActionController::ParameterMissing do |exception|
    render json: '', status: :bad_request
  end

  def render_400(msg: nil)
    render json: { message: msg }, status: :bad_request
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  protected

  def pretty_format(subject)
    resource = ActiveModelSerializers::SerializableResource.new(subject)
    JSON.pretty_generate resource.as_json
  end
end
