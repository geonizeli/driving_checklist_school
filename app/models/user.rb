class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :achievements, dependent: :destroy
  has_many :subscriptions, dependent: :destroy
  validates :name, presence: true
end
