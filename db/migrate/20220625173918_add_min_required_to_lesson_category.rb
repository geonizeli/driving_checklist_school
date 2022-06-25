class AddMinRequiredToLessonCategory < ActiveRecord::Migration[7.0]
  def change
    add_column :lesson_categories, :min_required, :integer, default: 0, null: false
  end
end
