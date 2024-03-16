class CreateImages < ActiveRecord::Migration[6.0]
  def change
    create_table :images do |t|
      t.integer :imageable_id
      t.string :imageable_type
      t.string :img

      t.timestamps
    end
  end
end
