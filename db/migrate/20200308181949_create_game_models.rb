class CreateGameModels < ActiveRecord::Migration[5.2]
  def change
    create_table :game_models do |t|
    	t.integer :game_id,null: false
    	t.integer :genre_id,null: false

      t.timestamps
    end
  end
end
