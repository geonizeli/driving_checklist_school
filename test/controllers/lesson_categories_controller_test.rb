require "test_helper"

class LessonCategoriesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    get '/users/sign_in'
    sign_in users(:one)
    post user_session_url

    @lesson_category = lesson_categories(:one)
  end

  test "should get index" do
    get lesson_categories_url
    assert_response :success
  end

  test "should get new" do
    get new_lesson_category_url
    assert_response :success
  end

  test "should create lesson_category" do
    assert_difference("LessonCategory.count") do
      post lesson_categories_url, params: { lesson_category: { name: SecureRandom.uuid, min_required: SecureRandom.rand(10) } }
    end

    assert_redirected_to lesson_category_url(LessonCategory.last)
  end

  test "should show lesson_category" do
    get lesson_category_url(@lesson_category)
    assert_response :success
  end

  test "should get edit" do
    get edit_lesson_category_url(@lesson_category)
    assert_response :success
  end

  test "should update lesson_category" do
    patch lesson_category_url(@lesson_category), params: { lesson_category: { name: @lesson_category.name, min_required: @lesson_category.min_required } }
    assert_redirected_to lesson_category_url(@lesson_category)
  end

  test "should not destroy the lesson_category when there are no dependent lessons" do
    assert_difference("LessonCategory.count", 0) do
      delete lesson_category_url(@lesson_category)
    end

    assert_response :unprocessable_entity
  end

  test "should not destroy the lesson_category when there are dependent lessons" do
    lesson_category = lesson_categories(:two)
    lesson_category.lessons.each do |lesson|
      lesson.achievements.destroy_all
      lesson.destroy
    end

    assert_difference("LessonCategory.count", -1) do
      delete lesson_category_url(lesson_category)
    end

    assert_redirected_to lesson_categories_url
  end
end
