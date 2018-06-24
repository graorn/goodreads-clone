class CreateFavoriteBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :favorite_books do |t|
      t.belongs_to :user, index: true
      t.belongs_to :book, index: true
      t.boolean :favorite

      t.timestamps
    end
  end
end
