class UserSubscriptionReportServiceTest < ActiveSupport::TestCase
  setup do
    @user = users(:one)
    @lesson_category_one = lesson_categories(:one)
    @lesson_category_two = lesson_categories(:two)

    @service = UserSubscriptionReportService.new(@user)
  end

  test "visiting the index" do
    @service.call

    assert_equal(@service.call, {
      @lesson_category_one.id: {
        category_name: @lesson_category_one.name,
        lessons_count: 1,
        achievements_count: 1,
      }
      @lesson_category_two.id: {
        category_name: @lesson_category_two.name,
        lessons_count: 1,
        achievements_count: 0,
      }
    })
  end
end