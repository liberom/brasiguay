class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :locations do |t|
      t.integer :user_id
      t.integer :locatable_id
      t.string :locatable_type
      t.string :placement

      t.timestamps
    end
  end
end
