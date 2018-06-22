class RemoveFavoriteFromBooks < ActiveRecord::Migration[5.2]
  def change
    remove_column :books, :favorite, :boolean
  end
end
