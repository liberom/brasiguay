class CreateEstates < ActiveRecord::Migration[6.0]
  def change
    create_table :estates do |t|
      t.string :title
      t.integer :type
      t.integer :modality
      t.integer :user_id
      t.float :price
      t.integer :currency
      t.float :area

      t.timestamps
    end
  end
end
