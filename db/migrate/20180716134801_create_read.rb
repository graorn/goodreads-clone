class CreateRead < ActiveRecord::Migration[5.2]
  def change
    create_table :reads do |t|
      t.references :user, foreign_key: true, null: false, unique: true
      t.references :book, foreign_key: true, null: false, unique: true
    end
  end
end
