class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.member_id = current_member.id
    @game = Game.find(params[:game_id])
    @comment.game_id = @game.id
    if @comment.save
      redirect_to game_path(@game.id)
    else
      @models = GameModel.where(game_id: @game.id)
      @playtimes = @game.playtimes
      @playtime = Playtime.new
      @comments = @game.comments.page(params[:page]).per(5).reverse_order
      flash[:notice]="コメントを空欄では送信できません"
      render 'games/show'
    end

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
