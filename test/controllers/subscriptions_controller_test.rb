require "test_helper"

class SubscriptionsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    get '/users/sign_in'
    sign_in users(:one)
    post user_session_url

    @subscription = subscriptions(:one)
  end

  test "should get index" do
    get subscriptions_url
    assert_response :success
  end

  test "should get new" do
    get new_subscription_url
    assert_response :success
  end

  test "should create subscription" do
    assert_difference("Subscription.count") do
      post subscriptions_url, params: { subscription: { concluded_at: @subscription.concluded_at, started_at: @subscription.started_at, user_id: @subscription.user_id } }
    end

    assert_redirected_to subscription_url(Subscription.last)
  end

  test "should show subscription" do
    get subscription_url(@subscription)
    assert_response :success
  end

  test "should get edit" do
    get edit_subscription_url(@subscription)
    assert_response :success
  end

  test "should update subscription" do
    patch subscription_url(@subscription), params: { subscription: { concluded_at: @subscription.concluded_at, started_at: @subscription.started_at, user_id: @subscription.user_id } }
    assert_redirected_to subscription_url(@subscription)
  end

  test "should not destroy the subscription when there are dependent achievements" do
    assert_difference("Subscription.count", 0) do
      delete subscription_url(@subscription)
    end

    assert_response :unprocessable_entity
  end

  test "should destroy the subscription when there are no dependent achievements" do
    subscription_two = subscriptions(:two)
    subscription_two.achievements.destroy_all

    assert_difference("Subscription.count", -1) do
      delete subscription_url(subscription_two)
    end

    assert_redirected_to subscriptions_url
  end
end
