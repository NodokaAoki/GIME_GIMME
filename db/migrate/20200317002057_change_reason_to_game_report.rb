class ChangeReasonToGameReport < ActiveRecord::Migration[5.2]
  def up
    change_column :game_reports, :reason, :integer, null: false, default: nil
  end

  def down
    change_column :game_reports, :reason, :integer, null: false, default: 0
  end
end
