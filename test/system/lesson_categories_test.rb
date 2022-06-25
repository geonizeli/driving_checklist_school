require "application_system_test_case"

class LessonCategoriesTest < ApplicationSystemTestCase
  setup do
    @lesson_category = lesson_categories(:one)
  end

  test "visiting the index" do
    visit lesson_categories_url
    assert_selector "h1", text: "Lesson categories"
  end

  test "should create lesson category" do
    visit lesson_categories_url
    click_on "New lesson category"

    fill_in "Name", with: @lesson_category.name
    click_on "Create Lesson category"

    assert_text "Lesson category was successfully created"
    click_on "Back"
  end

  test "should update Lesson category" do
    visit lesson_category_url(@lesson_category)
    click_on "Edit this lesson category", match: :first

    fill_in "Name", with: @lesson_category.name
    click_on "Update Lesson category"

    assert_text "Lesson category was successfully updated"
    click_on "Back"
  end

  test "should destroy Lesson category" do
    visit lesson_category_url(@lesson_category)
    click_on "Destroy this lesson category", match: :first

    assert_text "Lesson category was successfully destroyed"
  end
end
