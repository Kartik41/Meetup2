class CreateFriends < ActiveRecord::Migration[6.1]
  def change
    create_table :friends do |t|
      t.text :first_name
      t.text :last_name
      t.text :email
      t.text :phone
      t.text :twitter

      t.timestamps
    end
  end
end
