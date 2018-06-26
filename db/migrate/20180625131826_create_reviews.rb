# frozen_string_literal: true

class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.text :body
      t.references :reviewable, polymorphic: true, index: true

      t.timestamps
    end

    add_index :reviews, :reviewable_id
  end
end
