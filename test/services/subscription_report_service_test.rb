class SubscriptionReportServiceTest < ActiveSupport::TestCase
  setup do
    subscription = subscriptions(:one)

    @lesson_category_one = subjects(:one)
    @lesson_category_two = subjects(:two)
    subscription.subjects = [@lesson_category_one, @lesson_category_two]

    @service = SubscriptionReportService.new(subscription)
  end

  test "visiting the index" do
    @service.call

    assert_equal(@service.call, {
      @lesson_category_one.id => {
        :category_name=>"MyString",
        :subject_hours=>1,
        :achievements_count=>0},
      @lesson_category_two.id => {
        :category_name=>"MyString",
        :subject_hours=>1,
        :achievements_count=>0
      }
    })
  end
end