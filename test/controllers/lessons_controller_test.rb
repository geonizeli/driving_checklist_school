require "test_helper"

class LessonsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    get '/users/sign_in'
    sign_in users(:one)
    post user_session_url

    @lesson = lessons(:one)
  end

  test "should get index" do
    get lessons_url
    assert_response :success
  end

  test "should get new" do
    get new_lesson_url
    assert_response :success
  end

  test "should create lesson" do
    assert_difference("Lesson.count") do
      post lessons_url, params: { lesson: { lesson_category_id: @lesson.lesson_category_id, name: @lesson.name } }
    end

    assert_redirected_to lesson_url(Lesson.last)
  end

  test "should show lesson" do
    get lesson_url(@lesson)
    assert_response :success
  end

  test "should get edit" do
    get edit_lesson_url(@lesson)
    assert_response :success
  end

  test "should update lesson" do
    patch lesson_url(@lesson), params: { lesson: { lesson_category_id: @lesson.lesson_category_id, name: @lesson.name } }
    assert_redirected_to lesson_url(@lesson)
  end

  test "should not destroy the lesson when there are dependent achievements" do
    assert_difference("Lesson.count", 0) do
      delete lesson_url(@lesson)
    end

    assert_response :unprocessable_entity
  end

  test "should not destroy the lesson when there are no dependent achievements" do
    lesson_two = lessons(:two)
    lesson_two.achievements.destroy_all

    assert_difference("Lesson.count", -1) do
      delete lesson_url(lesson_two)
    end

    assert_redirected_to lessons_url
  end
end
