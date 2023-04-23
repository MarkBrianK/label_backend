class UsersController < ApplicationController


  def new
    @user = User.new
    render json: @user
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      render json: @user
    else
      render json: {errors: "unprocessable"}, status: :unprocessable_entity
    end
  end

  def update
    @user = current_user

    if @user.update(user_params)
      render json: @user
    else
      render json: {errors: "unprocessable"}, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :username, :profile_picture)
  end

end
