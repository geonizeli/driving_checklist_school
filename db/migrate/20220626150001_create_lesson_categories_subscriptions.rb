class CreateLessonCategoriesSubscriptions < ActiveRecord::Migration[7.0]
  def change
    create_table :lesson_categories_subscriptions, id: false do |t|
      t.belongs_to :subscription
      t.belongs_to :lesson_category
    end
  end
end
