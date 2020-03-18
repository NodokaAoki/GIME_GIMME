class CreateCommentReports < ActiveRecord::Migration[5.2]
  def change
    create_table :comment_reports do |t|
      t.integer :comment_id, null: false
      t.text :report, null: false
      t.integer :status, null: false, default: 0
      t.text :correspondence
      t.integer :reason, null: false

      t.timestamps
    end
  end
end
