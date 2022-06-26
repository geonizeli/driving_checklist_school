class ChangeUserToSubscriptionRefereceFromAchievement < ActiveRecord::Migration[7.0]
  def change
    remove_reference :achievements, :user, null: false, foreign_key: true
    add_reference :achievements, :subscription, null: true, foreign_key: true
  end
end
