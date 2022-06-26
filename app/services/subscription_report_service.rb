class SubscriptionReportService
  def initialize(subscription)
    @subscription = subscription
  end

  def call
    result_by_subject_id = {}

    subjects.each do |subject|
      result_by_subject_id[subject.id] = {
        subject_name: subject.name,
        subject_hours: subject.min_hours,
        achievements_count: achievements_by_subject_ids_count(subject.id),
      }
    end

    result_by_subject_id
  end

  def achievements_by_subject_ids_count(subject_ids)
    @subscription
      .achievements
      .where(subject_id: subject_ids)
      .count
  end

  def subjects
    @subscription.subjects
  end
end