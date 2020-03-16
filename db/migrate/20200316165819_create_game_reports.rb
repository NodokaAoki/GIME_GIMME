class CreateGameReports < ActiveRecord::Migration[5.2]
  def change
    create_table :game_reports do |t|
      t.integer :game_id, null: false
      t.text :report, null: false
      t.integer :status, null: false, default: 0
      t.text :correspondence

      t.timestamps
    end
  end
end
