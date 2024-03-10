class CreateAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :accounts do |t|
      t.integer :user_id
      t.datetime :activation
      t.datetime :expiration
      t.integer :plan

      t.timestamps
    end
  end
end
