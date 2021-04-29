require 'test_helper'

class Customer::UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @customer_user = customer_users(:one)
  end

  test "should get index" do
    get customer_users_url
    assert_response :success
  end

  test "should get new" do
    get new_customer_user_url
    assert_response :success
  end

  test "should create customer_user" do
    assert_difference('Customer::User.count') do
      post customer_users_url, params: { customer_user: { confirm_token: @customer_user.confirm_token, email: @customer_user.email, password: @customer_user.password, role: @customer_user.role, status: @customer_user.status, username: @customer_user.username }}
    end

    assert_redirected_to customer_user_url(Customer::User.last)
  end

  test "should show customer_user" do
    get customer_user_url(@customer_user)
    assert_response :success
  end

  test "should get edit" do
    get edit_customer_user_url(@customer_user)
    assert_response :success
  end

  test "should update customer_user" do
    patch customer_user_url(@customer_user), params: { customer_user: {  } }
    assert_redirected_to customer_user_url(@customer_user)
  end

  test "should destroy customer_user" do
    assert_difference('Customer::User.count', -1) do
      delete customer_user_url(@customer_user)
    end

    assert_redirected_to customer_users_url
  end
end
