# frozen_string_literal: true

class CreateReadingLists < ActiveRecord::Migration[5.2]
  def change
    create_table :reading_lists do |t|
      t.references :user, foreign_key: true
      t.references :book, foreign_key: true, uniq: true

      t.timestamps
    end
  end
end
