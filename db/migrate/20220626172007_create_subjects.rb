class CreateSubjects < ActiveRecord::Migration[7.0]
  def change
    create_table :subjects do |t|
      t.string :name
      t.integer :min_hours

      t.timestamps
    end
  end
end
