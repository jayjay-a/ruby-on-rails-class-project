require 'test_helper'

class UserStatusesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_status = user_statuses(:one)
  end

  test "should get index" do
    get user_statuses_url
    assert_response :success
  end

  test "should get new" do
    get new_user_status_url
    assert_response :success
  end

  test "should create user_status" do
    assert_difference('UserStatus.count') do
      post user_statuses_url, params: { user_status: { status_description: @user_status.status_description, user_id: @user_status.user_id } }
    end

    assert_redirected_to user_status_url(UserStatus.last)
  end

  test "should show user_status" do
    get user_status_url(@user_status)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_status_url(@user_status)
    assert_response :success
  end

  test "should update user_status" do
    patch user_status_url(@user_status), params: { user_status: { status_description: @user_status.status_description, user_id: @user_status.user_id } }
    assert_redirected_to user_status_url(@user_status)
  end

  test "should destroy user_status" do
    assert_difference('UserStatus.count', -1) do
      delete user_status_url(@user_status)
    end

    assert_redirected_to user_statuses_url
  end
end
