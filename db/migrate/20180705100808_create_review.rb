# frozen_string_literal: true

class CreateReview < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.references :reviewable, polymorphic: true, index: true
      t.references :reviewer, polymorphic: true, index: true

      t.integer :rating
      t.text :body
      t.text :title

      t.timestamps
    end
    add_index :reviews, %i[reviewer_id reviewer_type]
    add_index :reviews, %i[reviewable_id reviewable_type]
  end
end
