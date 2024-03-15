class CreateServices < ActiveRecord::Migration[6.0]
  def change
    create_table :services do |t|
      t.integer :user_id
      t.string :title
      t.float :price
      t.integer :currency

      t.timestamps
    end
  end
end
