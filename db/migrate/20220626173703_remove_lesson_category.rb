class RemoveLessonCategory < ActiveRecord::Migration[7.0]
  def change
    remove_reference :lesson_categories_subscriptions, :lesson_category

    drop_table :lesson_categories
  end
end
