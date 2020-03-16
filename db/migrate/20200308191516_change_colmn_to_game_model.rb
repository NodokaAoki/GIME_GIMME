class ChangeColmnToGameModel < ActiveRecord::Migration[5.2]
  def change
  	rename_column :game_models, :genre_id, :model_id
  end
end
