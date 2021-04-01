class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.text :title
      t.belongs_to :friend, null: false, foreign_key: true

      t.timestamps
    end
  end
end
