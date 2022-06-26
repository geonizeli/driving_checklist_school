class AddSubjectReferenceToAchievements < ActiveRecord::Migration[7.0]
  def change
    add_reference :achievements, :subject, foreign_key: true
  end
end
