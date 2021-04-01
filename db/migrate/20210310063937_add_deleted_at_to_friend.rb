class AddDeletedAtToFriend < ActiveRecord::Migration[6.1]
  def change
    add_column :friends, :deleted_at, :datetime
    add_index :friends, :deleted_at
  end
end
