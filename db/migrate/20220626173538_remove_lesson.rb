class RemoveLesson < ActiveRecord::Migration[7.0]
  def change
    remove_reference :achievements, :lesson, foreign_key: true

    drop_table :lessons
  end
end
