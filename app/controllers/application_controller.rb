class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  after_action :set_csrf_cookie
  skip_before_action :verify_authenticity_token

  def get_csrf_token
    render json: { csrfToken: form_authenticity_token }
  end

 def set_csrf_cookie
  cookies['X-CSRF-Token'] = {
    value: form_authenticity_token,
    same_site: :none,
    secure: true
  }
end
  private
  def authenticate_user!
    unless current_user
      render json: { error: "You need to sign in or sign up before continuing." }, status: :unauthorized
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
end
