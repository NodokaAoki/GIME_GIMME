class GamesController < ApplicationController
  def new
    @game = Game.new
    @playtime = @game.playtimes.build
  end

  def create
    @game = Game.new(game_params)
    @game.member_id = current_member.id
    @game.save!
    redirect_to game_path(@game.id)
  end

  def show
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
    params.require(:game).permit(:title,:release,:number_of_people,:text,:complete,:orbit,:multi_ending,:site_url,:status,playtimes_attributes: [:id, :time,:member_id])
  end
end
