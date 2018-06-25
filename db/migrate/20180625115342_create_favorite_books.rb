class CreateFavoriteBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :favorite_books do |t|
      t.references :user, foreign_key: true
      t.references :book, foreign_key: true

      t.timestamps
    end
  end
end
