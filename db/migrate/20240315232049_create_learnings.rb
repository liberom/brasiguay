class CreateLearnings < ActiveRecord::Migration[6.0]
  def change
    create_table :learnings do |t|
      t.integer :profile_id
      t.string :institution
      t.date :date_from
      t.date :date_to
      t.text :description

      t.timestamps
    end
  end
end
