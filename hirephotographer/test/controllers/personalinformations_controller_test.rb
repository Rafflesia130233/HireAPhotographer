require 'test_helper'

class PersonalinformationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @personalinformation = personalinformations(:one)
  end

  test "should get index" do
    get personalinformations_url
    assert_response :success
  end

  test "should get new" do
    get new_personalinformation_url
    assert_response :success
  end

  test "should create personalinformation" do
    assert_difference('Personalinformation.count') do
      post personalinformations_url, params: { personalinformation: {  } }
    end

    assert_redirected_to personalinformation_url(Personalinformation.last)
  end

  test "should show personalinformation" do
    get personalinformation_url(@personalinformation)
    assert_response :success
  end

  test "should get edit" do
    get edit_personalinformation_url(@personalinformation)
    assert_response :success
  end

  test "should update personalinformation" do
    patch personalinformation_url(@personalinformation), params: { personalinformation: {  } }
    assert_redirected_to personalinformation_url(@personalinformation)
  end

  test "should destroy personalinformation" do
    assert_difference('Personalinformation.count', -1) do
      delete personalinformation_url(@personalinformation)
    end

    assert_redirected_to personalinformations_url
  end
end
