require "test_helper"

class LessonCategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
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
      post lesson_categories_url, params: { lesson_category: { name: @lesson_category.name, min_required: @lesson_category.min_required } }
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

  test "should destroy lesson_category" do
    assert_difference("LessonCategory.count", -1) do
      delete lesson_category_url(@lesson_category)
    end

    assert_redirected_to lesson_categories_url
  end
end
