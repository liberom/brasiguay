class CreateJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :jobs do |t|
      t.integer :user_id
      t.string :title
      t.integer :modality

      t.timestamps
    end
  end
end
