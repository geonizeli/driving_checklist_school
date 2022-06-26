class LessonCategory < ApplicationRecord
  has_many :lessons, dependent: :restrict_with_error
  has_and_belongs_to_many :subscriptions

  validates :name, presence: true, uniqueness: true
  validates :min_required, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
