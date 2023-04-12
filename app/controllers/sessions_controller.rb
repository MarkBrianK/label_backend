class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      render json: { success: true, message: 'Logged in successfully.' }
    else
      render json: { success: false, message: 'Invalid email or password.' }
    end
  end

  def destroy
    session[:user_id] = nil
    render json: { success: true, message: 'Logged out successfully.' }
  end
end

