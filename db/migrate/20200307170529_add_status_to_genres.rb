class AddStatusToGenres < ActiveRecord::Migration[5.2]
  def change
    add_column :genres, :status, :boolean, null: false,default: true
  end
end
