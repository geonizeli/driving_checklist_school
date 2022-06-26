class Achievement < ApplicationRecord
  belongs_to :lesson
  belongs_to :subscription

  validates :concluded_at, presence: true
end
