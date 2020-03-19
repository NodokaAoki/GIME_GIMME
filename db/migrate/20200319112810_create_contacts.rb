class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.text :contact_text, null: false
      t.text :answer
      t.string :email, null: false
      t.string :name, null: false

      t.timestamps
    end
  end
end
