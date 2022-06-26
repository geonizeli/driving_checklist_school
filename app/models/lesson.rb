class Lesson < ApplicationRecord
  belongs_to :lesson_category
  has_many :achievements, dependent: :restrict_with_error
end
