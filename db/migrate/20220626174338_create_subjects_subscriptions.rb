class CreateSubjectsSubscriptions < ActiveRecord::Migration[7.0]
  def change
    create_table :subjects_subscriptions, id: false do |t|
      t.belongs_to :subscription
      t.belongs_to :subject
    end
  end
end
