require 'test_helper'

class Photographer::UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @photographer_user = photographer_users(:michael)
  end

  test "should get index" do
    get photographer_users_url
    assert_response :success
  end

  test "should get new" do
    get new_photographer_user_url
    assert_response :success
  end

  test "should create photographer_user" do
    assert_difference('Photographer::User.count') do
      post photographer_users_url, params: { photographer_user: {  } }
    end

    assert_redirected_to photographer_user_url(Photographer::User.last)
  end

  test "should show photographer_user" do
    get photographer_user_url(@photographer_user)
    assert_response :success
  end

  test "should get edit" do
    get edit_photographer_user_url(@photographer_user)
    assert_response :success
  end

  test "should update photographer_user" do
    patch photographer_user_url(@photographer_user), params: { photographer_user: {  } }
    assert_redirected_to photographer_user_url(@photographer_user)
  end

  test "should destroy photographer_user" do
    assert_difference('Photographer::User.count', -1) do
      delete photographer_user_url(@photographer_user)
    end

    assert_redirected_to photographer_users_url
  end

  test "authenticated? should return false for a user with nil digest" do
    assert_not @photographer_user.authenticated?('')
  end
end
