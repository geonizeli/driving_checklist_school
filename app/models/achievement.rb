class Achievement < ApplicationRecord
  belongs_to :lesson
  belongs_to :user

  validates :concluded_at, presence: true
end
