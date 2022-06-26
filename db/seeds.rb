
user = User.find_by(
  email: 'test@test.com',
) || User.create(
  name: 'Test User',
  email: 'test@test.com',
  password: 'password'
)

lessons_categories = [LessonCategory.find_or_create_by(
  name: 'First aids',
  min_required: 20
),
LessonCategory.find_or_create_by(
  name: 'Laws',
  min_required: 20
),
LessonCategory.find_or_create_by(
  name: 'Mechanic',
  min_required: 20
)]

Subscription.find_by(
  user_id: user.id,
) || Subscription.create(
  user_id: user.id,
  lesson_categories: lessons_categories
)

lessons_categories.each_with_index do |lesson_category, index|
  Lesson.create!(name: "#{lesson_category.name} - #{index + 1}", lesson_category_id: lesson_category.id)
  Lesson.create!(name: "#{lesson_category.name} - #{index + 2}", lesson_category_id: lesson_category.id)
end