class UserSubscriptionReportService
  def initialize(user)
    @user = user
  end

  def call
    result_by_category_id = {}

    lessons_categories.each do |category|
      result_by_category_id[category.id] = {
        category_name: category.name,
        lessons_count: category.lessons.count,
        achievements_count: achievements_by_lesson_ids_count(category.lessons.pluck(:id)),
      }
    end

    result_by_category_id
  end

  def achievements_by_lesson_ids_count(lesson_ids)
    @user
      .achievements
      .includes(:lesson)
      .where(lesson_id: lesson_ids)
      .count
  end

  def lessons_categories
    LessonCategory.all.select(:id, :name)
  end
end