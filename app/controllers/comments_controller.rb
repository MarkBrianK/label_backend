class CommentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @comments = Comment.all
    render json: @comments
  end

  def create
    @comment = current_user.comments.build(comment_params)

    if @comment.save
      render json: @comment
    else
      render json: {errors: "unprocessable"}, status: :unprocessable_entity
    end
  end

  def update
    @comment = current_user.comments.find(params[:id])

    if @comment.update(comment_params)
      render json: @comment
    else
      render json: {errors: "unprocessable"}, status: :unprocessable_entity
    end
  end

  def destroy
    @comment = current_user.comments.find(params[:id])
    @comment.destroy
    head :no_content
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :cloth_id)
  end
end
