class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :reviewer
      t.string :reviewed_book
      t.text :text

      t.timestamps
    end
  end
end
