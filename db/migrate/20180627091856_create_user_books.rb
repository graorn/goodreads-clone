class CreateUserBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :user_books do |t|
      t.references :user, foreign_key: true, null: false
      t.references :book, foreign_key: true, null: false
      t.text :review
      t.boolean :favorite
      t.integer :rating, limit: 5
      t.boolean :to_read

      t.timestamps
    end
  end
end
