class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.integer :currency
      t.integer :user_id
      t.integer :language

      t.timestamps
    end
  end
end
