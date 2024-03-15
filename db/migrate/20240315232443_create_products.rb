class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.integer :user_id
      t.string :name
      t.float :price
      t.integer :currency

      t.timestamps
    end
  end
end
