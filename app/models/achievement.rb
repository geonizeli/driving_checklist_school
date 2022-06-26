class Achievement < ApplicationRecord
  belongs_to :subject
  belongs_to :subscription

  validates :concluded_at, presence: true
end
