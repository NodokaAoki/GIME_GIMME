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
    @playtimes = @game.playtimes
    @playtime = Playtime.new
  end

  def playtime_create
    @playtime = Playtime.new(playtime_params)
    @playtime.game_id = params[:id]
    @playtime.member_id = current_member.id
    @playtime.save!
    redirect_to game_path(@playtime.game_id)
  end

  def edit
  end

  def update
  end

  def delete_game
  end

  def hidden
  end

  private
  def game_params
    params.require(:game).permit(:title,:release,:number_of_people,:text,:complete,:orbit,:multi_ending,:site_url,:status,:genre_id,:cero_rating,playtimes_attributes: [ :time,:member_id])
  end
  def playtime_params
    params.require(:playtime).permit(:time,:member_id)
  end
end
