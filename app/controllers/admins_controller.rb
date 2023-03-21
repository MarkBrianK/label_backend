class AdminsController < ApplicationController
  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(admin_params)

    if @admin.save
      session[:admin_id] = @admin.id
      redirect_to root_path, notice: 'Admin was successfully created.'
    else
      render :new
    end
  end

  def index
    @users = User.all
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to admins_path, notice: 'User was successfully deleted.'
  end

  private

  def admin_params
    params.require(:admin).permit(:name, :email, :password, :password_confirmation)
  end
end
