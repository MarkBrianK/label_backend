class LikesController < ApplicationController
  before_action :authenticate_user!

  def index
    @likes = Like.all
    render json: @likes
  end

  def create
    @like = current_user.likes.build(like_params)

    if @like.save
      render json: @like
    else
      render json: {errors: "unprocessable"}, status: :unprocessable_entity
    end
  end

  def destroy
    @like = current_user.likes.find_by(cloth_id: params[:cloth_id])
    @like.destroy
    head :no_content
  end

  private

  def like_params
    params.require(:like).permit(:cloth_id)
  end
end
