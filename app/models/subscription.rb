class Subscription < ApplicationRecord
  belongs_to :user
  has_many :achievements, dependent: :restrict_with_error
  has_and_belongs_to_many :subjects, dependent: :restrict_with_error

  def name
    "#{user.name}'s subscription"
  end

  def report
    SubscriptionReportService.new(self).call
  end
end
