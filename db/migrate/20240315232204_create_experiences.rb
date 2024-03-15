class CreateExperiences < ActiveRecord::Migration[6.0]
  def change
    create_table :experiences do |t|
      t.integer :profile_id
      t.string :company
      t.string :position
      t.date :date_from
      t.date :date_to

      t.timestamps
    end
  end
end
