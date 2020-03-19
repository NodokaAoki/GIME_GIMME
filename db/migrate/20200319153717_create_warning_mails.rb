class CreateWarningMails < ActiveRecord::Migration[5.2]
  def change
    create_table :warning_mails do |t|
      t.integer :member_id, null: false
      t.text :warning_text, null: false
      t.timestamps
    end
  end
end
