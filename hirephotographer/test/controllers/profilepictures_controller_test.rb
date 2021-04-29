require 'test_helper'

class ProfilepicturesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @profilepicture = profilepictures(:one)
  end

  test "should get index" do
    get profilepictures_url
    assert_response :success
  end

  test "should get new" do
    get new_profilepicture_url
    assert_response :success
  end

  test "should create profilepicture" do
    assert_difference('Profilepicture.count') do
      post profilepictures_url, params: { profilepicture: {  } }
    end

    assert_redirected_to profilepicture_url(Profilepicture.last)
  end

  test "should show profilepicture" do
    get profilepicture_url(@profilepicture)
    assert_response :success
  end

  test "should get edit" do
    get edit_profilepicture_url(@profilepicture)
    assert_response :success
  end

  test "should update profilepicture" do
    patch profilepicture_url(@profilepicture), params: { profilepicture: {  } }
    assert_redirected_to profilepicture_url(@profilepicture)
  end

  test "should destroy profilepicture" do
    assert_difference('Profilepicture.count', -1) do
      delete profilepicture_url(@profilepicture)
    end

    assert_redirected_to profilepictures_url
  end
end
