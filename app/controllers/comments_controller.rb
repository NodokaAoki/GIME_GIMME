class CommentsController < ApplicationController
  def create
    @comment = current_member.comments.new(comment_params)
    @game = Game.find(params[:game_id])
    @comment.game_id = @game.id
    @comment.save!
    redirect_to game_path(@game.id)
  end

  def destroy
  	comment = Comment.find(params[:game_id])
  	comment.destroy
  	redirect_to game_path(comment.game_id)
  end

  private
  def comment_params
    params.require(:comment).permit(:comment)
  end
end
