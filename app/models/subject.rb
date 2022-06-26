class Subject < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :min_hours, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
