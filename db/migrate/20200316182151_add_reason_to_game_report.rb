class AddReasonToGameReport < ActiveRecord::Migration[5.2]
  def change
    add_column :game_reports, :reason, :integer, null: false,default: 0
  end
end
