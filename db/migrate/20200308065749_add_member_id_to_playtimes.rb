class AddMemberIdToPlaytimes < ActiveRecord::Migration[5.2]
  def change
    add_column :playtimes, :member_id, :integer,nill: false
  end
end
