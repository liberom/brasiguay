class CreateFavorites < ActiveRecord::Migration[6.0]
  def change
    create_table :favorites do |t|
      t.integer :user_id
      t.integer :favorable_id
      t.string :favorable_type
      t.boolean :favorited

      t.timestamps
    end
  end
end
