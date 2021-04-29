require 'test_helper'

class HomePageControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get home_page_index_url
    assert_response :success
  end


  test "should get signup" do
    get home_page_signup_path
    assert_response :success
  end

end
