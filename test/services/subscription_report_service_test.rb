class SubscriptionReportServiceTest < ActiveSupport::TestCase
  setup do
    subscription = subscriptions(:one)

    @lesson_category_one = lesson_categories(:one)
    @lesson_category_two = lesson_categories(:two)
    subscription.lesson_categories = [@lesson_category_one, @lesson_category_two]

    @service = SubscriptionReportService.new(subscription)
  end

  test "visiting the index" do
    @service.call

    assert_equal(@service.call, {
      @lesson_category_one.id => {
        category_name: "Laws",
        lessons_count: 1,
        achievements_count: 1
      },
      @lesson_category_two.id => {
        category_name: "Mechanical",
        lessons_count: 1,
        achievements_count: 0
      }
    })
  end
end