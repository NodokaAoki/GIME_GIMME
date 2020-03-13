class FavoritesController < ApplicationController
  def create
    game = Game.find(params[:game_id])
    favorite = current_member.favorites.new(game_id: game.id)
    favorite.save!
    redirect_to game_path(game.id)
  end

  def destroy
    game = Game.find(params[:game_id])
    favorite = current_member.favorites.find_by(game_id: game.id)
    favorite.destroy
    redirect_to game_path(game.id)
  end
end
