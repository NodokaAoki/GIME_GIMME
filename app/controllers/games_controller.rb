class GamesController < ApplicationController

  def new
    @game = Game.new
    @playtime = @game.playtimes.build
    @genres = Genre.where(status: 'true')
  end

  def create
    @game = Game.new(game_params)
    @game.member_id = current_member.id
    @game.save!
    redirect_to game_path(@game.id)
  end

  def show
    @game = Game.find(params[:id])
    @models = GameModel.where(game_id: @game.id)
    @playtimes = @game.playtimes
    @playtime = Playtime.new
    @comments = @game.comments.reverse_order
    @comment = Comment.new
  end

  def playtime_create
    @playtime = Playtime.new(playtime_params)
    @playtime.game_id = params[:id]
    @playtime.member_id = current_member.id
    @playtime.save!
    redirect_to game_path(@playtime.game_id)
  end

  def edit
    @game = Game.find(params[:id])
    @genres = Genre.where(status: 'true')
  end

  def update
    @game = Game.find(params[:id])
    @game.update!(game_params)
    redirect_to game_path(@game.id)
  end

  def hidden
    @game = Game.find(params[:id])
    if @game.status == true
      @game.status = false
      @game.save!
      redirect_to game_path(@game.id),notice: "記事を非公開にしました。"
    else
      @game.status = true
      @game.save!
      redirect_to game_path(@game.id),notice: "記事を公開にしました。"
    end
  end

  def delete
    @game = Game.find(params[:id])
    @game.destoy
    redirect_to root_path, notice: "記事を完全に削除しました。"
  end

  private
  def game_params
    params.require(:game).permit(:title,:release,:number_of_people,:text,:complete,:orbit,:multi_ending,:site_url,:status,:genre_id,:cero_rating,model_ids:[],playtimes_attributes: [ :time,:member_id])
  end
  def playtime_params
    params.require(:playtime).permit(:time,:member_id)
  end

end
