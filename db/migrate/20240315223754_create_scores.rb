class CreateScores < ActiveRecord::Migration[6.0]
  def change
    create_table :scores do |t|
      t.integer :user_id
      t.integer :scorable_id
      t.string :scorable_type
      t.integer :value

      t.timestamps
    end
  end
end
