class Subject < ApplicationRecord
  has_and_belongs_to_many :subscriptions, dependent: :restrict_with_error
  has_many :achievements, dependent: :restrict_with_error

  validates :name, presence: true, uniqueness: true
  validates :min_hours, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
