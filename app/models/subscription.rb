class Subscription < ApplicationRecord
  belongs_to :user
  has_many :achievements, dependent: :restrict_with_error
  has_and_belongs_to_many :lesson_categories

  def name
    "#{user.name}'s subscription"
  end
end
