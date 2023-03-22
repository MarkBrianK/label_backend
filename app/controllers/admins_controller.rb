class AdminsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @admins = User.all
    render json: @admins
  end
  def new
    @admin = Admin.new
    render json: @admin
  end

  def create
    @admin = Admin.new(admin_params)

    if @admin.save
      session[:admin_id] = @admin.id
      render json: @admin

    else
      render json: @admin.errors, status: :unprocessable_entity

    end
  end


  def destroy
    user = User.find(params[:id])
    user.destroy
    render json: { message: 'successfully deleted'}, status: :ok
  end

  private

  def admin_params
    params.require(:admin).permit(:name, :email, :password, :password_confirmation)
  end
end
