class CreateFavoriteBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :favorite_books do |t|
      t.belongs_to :user, index: true, unique: true
      t.belongs_to :book, index: true, unique: true
      t.boolean :favorite, unique: true

      t.timestamps
    end
  end
end
