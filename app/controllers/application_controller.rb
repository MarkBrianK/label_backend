class ApplicationController < ActionController::Base
  include Devise::Controllers::Helpers
  skip_before_action :verify_authenticity_token
  protect_from_forgery with: :exception
  after_action :set_csrf_cookie


  before_action :verify_authenticity_token, except: [:get_csrf_token]

  def get_csrf_token
    render json: { csrfToken: form_authenticity_token }
  end
  def set_csrf_cookie
    cookies['CSRF-TOKEN'] = form_authenticity_token if protect_against_forgery?
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
