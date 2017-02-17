class ApplicationController < ActionController::API
  before_action :set_locale

  rescue_from ActionController::ParameterMissing do |exception|
    render body: nil, status: :bad_request
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
end
