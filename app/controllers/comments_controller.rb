class CommentsController < ApplicationController
  def create
    Comment.create(comment_params)
  end

  def show
    @comment = Comment.new
    @comments = @item.comments.includes(:user)

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, item_id: params[:item_id])
end
