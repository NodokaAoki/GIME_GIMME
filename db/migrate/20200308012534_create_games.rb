class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
    	t.integer :member_id,null: false
    	t.integer :genre_id,null: false
    	t.text :title, null: false
    	t.date :release, null: false
    	t.integer :number_of_people, null: false
		t.text :text, null: false
		t.boolean :complete, null: false
		t.boolean :orbit, null: false
		t.boolean :multi_ending, null: false
		t.integer :cero_rating, null: false
		t.text :site_url
		t.boolean :status, null: false, default: true

      t.timestamps
    end
    add_index :games, :title,                unique: true
  end
end
