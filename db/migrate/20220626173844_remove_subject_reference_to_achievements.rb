class RemoveSubjectReferenceToAchievements < ActiveRecord::Migration[7.0]
  def change
    drop_table :lesson_categories_subscriptions
  end
end
