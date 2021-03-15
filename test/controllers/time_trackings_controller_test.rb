require "test_helper"

class TimeTrackingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @time_tracking = time_trackings(:one)
  end

  test "should get index" do
    get time_trackings_url, as: :json
    assert_response :success
  end

  test "should create time_tracking" do
    assert_difference('TimeTracking.count') do
      post time_trackings_url, params: { time_tracking: { end_at: @time_tracking.end_at, start_at: @time_tracking.start_at, user_id: @time_tracking.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show time_tracking" do
    get time_tracking_url(@time_tracking), as: :json
    assert_response :success
  end

  test "should update time_tracking" do
    patch time_tracking_url(@time_tracking), params: { time_tracking: { end_at: @time_tracking.end_at, start_at: @time_tracking.start_at, user_id: @time_tracking.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy time_tracking" do
    assert_difference('TimeTracking.count', -1) do
      delete time_tracking_url(@time_tracking), as: :json
    end

    assert_response 204
  end
end
