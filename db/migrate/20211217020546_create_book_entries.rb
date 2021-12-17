class CreateBookEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :book_entries do |t|
      t.string :title
      t.string :author
      t.string :genre
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
