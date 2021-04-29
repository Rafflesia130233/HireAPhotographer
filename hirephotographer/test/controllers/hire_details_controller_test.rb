require 'test_helper'

class HireDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hire_detail = hire_details(:one)
  end

  test "should get index" do
    get hire_details_url
    assert_response :success
  end

  test "should get new" do
    get new_hire_detail_url
    assert_response :success
  end

  test "should create hire_detail" do
    assert_difference('HireDetail.count') do
      post hire_details_url, params: { hire_detail: {  } }
    end

    assert_redirected_to hire_detail_url(HireDetail.last)
  end

  test "should show hire_detail" do
    get hire_detail_url(@hire_detail)
    assert_response :success
  end

  test "should get edit" do
    get edit_hire_detail_url(@hire_detail)
    assert_response :success
  end

  test "should update hire_detail" do
    patch hire_detail_url(@hire_detail), params: { hire_detail: {  } }
    assert_redirected_to hire_detail_url(@hire_detail)
  end

  test "should destroy hire_detail" do
    assert_difference('HireDetail.count', -1) do
      delete hire_detail_url(@hire_detail)
    end

    assert_redirected_to hire_details_url
  end
end
