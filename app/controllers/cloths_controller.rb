class ClothsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @cloths = Cloth.all.includes(:category)
    render json: @cloths, include: :category
  end

  def show
    @cloth = Cloth.includes(:category).find(params[:id])
    @likes = @cloth.likes
    render json: { cloth: @cloth, likes: @likes, category: @cloth.category }
  end

  def create
    if current_user.admin?
      @cloth = Cloth.new(cloth_params)
      @category = Category.find(params[:category_id])
      @cloth.category = @category

      if @cloth.save
        render json: @cloth, include: :category
      else
        render json: {errors: "unprocessable"}, status: :unprocessable_entity
      end
    else
      render json: {errors: "unauthorized"}, status: :unauthorized
    end
  end

  def destroy
    if current_user.admin?
      @cloth = Cloth.find(params[:id])
      @cloth.destroy
      head :no_content
    else
      render json: {errors: "unauthorized"}, status: :unauthorized
    end
  end

  private

  def cloth_params
    params.require(:cloth).permit(:name, :description, :price)
  end
end
