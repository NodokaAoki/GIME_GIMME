class FavoritesController < ApplicationController
  def create
    game = Game.find(params[:game_id])
    favorite = current_member.favorites.new(game_id: game.id)
    if favorite.save
      redirect_to game_path(game.id)
    else
      flash[:notice]="お気に入り登録できませんでした"
      render 'games/show'
    end
  end

  def destroy
    game = Game.find(params[:game_id])
    favorite = current_member.favorites.find_by(game_id: game.id)
    if favorite.destroy
      redirect_to game_path(game.id)
    else
      flash[:notice]="お気に入りから削除できませんでした"
      render 'games/show'
    end
  end
end
