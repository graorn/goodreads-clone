# frozen_string_literal: true

class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :genre
      t.string :description
      t.integer :rating
      t.text :review
      t.boolean :favorite
      t.boolean :to_read

      t.timestamps
    end
  end
end
