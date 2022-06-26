require "test_helper"

class SubjectsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    get '/users/sign_in'
    sign_in users(:one)
    post user_session_url

    @subject = subjects(:one)
  end

  test "should get index" do
    get subjects_url
    assert_response :success
  end

  test "should get new" do
    get new_subject_url
    assert_response :success
  end

  test "should create subject" do
    assert_difference("Subject.count") do
      post subjects_url, params: { subject: { min_hours: @subject.min_hours, name: SecureRandom.uuid } }
    end

    assert_redirected_to subject_url(Subject.last)
  end

  test "should show subject" do
    get subject_url(@subject)
    assert_response :success
  end

  test "should get edit" do
    get edit_subject_url(@subject)
    assert_response :success
  end

  test "should update subject" do
    patch subject_url(@subject), params: { subject: { min_hours: @subject.min_hours, name: SecureRandom.uuid } }
    assert_redirected_to subject_url(@subject)
  end

  test "should not destroy the subject when there are dependent achievements" do
    assert_difference("Subject.count", 0) do
      delete subject_url(@subject)
    end

    assert_response :unprocessable_entity
  end

  test "should destroy the subject when there are no dependent achievements" do
    subject_two = subjects(:two)
    subject_two.subscriptions.destroy_all
    subject_two.achievements.destroy_all

    assert_difference("Subject.count", -1) do
      delete subject_url(subject_two)
    end

    assert_redirected_to subjects_url
  end
end
