class Subscription < ApplicationRecord
  belongs_to :user

  has_and_belongs_to_many :lesson_categories
end
