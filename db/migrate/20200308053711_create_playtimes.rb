class CreatePlaytimes < ActiveRecord::Migration[5.2]
  def change
    create_table :playtimes do |t|
    	t.integer :game_id,null: false
    	t.integer :time,null: false

      t.timestamps
    end
  end
end
