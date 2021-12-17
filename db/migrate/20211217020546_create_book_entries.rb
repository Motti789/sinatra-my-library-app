class CreateBookEntries < ActiveRecord::Migration
  def change
    create_table :book_entries do |t|
      t.string :
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
