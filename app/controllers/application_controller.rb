class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def authorize
    head(401) and return false if params[:session_code].blank?
    @session = Session.find_by_code(params[:session_code])
    if @session.blank?
      render json: { success: false, error: 'Unauthorized' }, status: :unauthorized
      return false
    end
  end
end
