require 'test_helper'

class JobDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @job_detail = job_details(:one)
  end

  test "should get index" do
    get job_details_url
    assert_response :success
  end

  test "should get new" do
    get new_job_detail_url
    assert_response :success
  end

  test "should create job_detail" do
    assert_difference('JobDetail.count') do
      post job_details_url, params: { job_detail: {  } }
    end

    assert_redirected_to job_detail_url(JobDetail.last)
  end

  test "should show job_detail" do
    get job_detail_url(@job_detail)
    assert_response :success
  end

  test "should get edit" do
    get edit_job_detail_url(@job_detail)
    assert_response :success
  end

  test "should update job_detail" do
    patch job_detail_url(@job_detail), params: { job_detail: {  } }
    assert_redirected_to job_detail_url(@job_detail)
  end

  test "should destroy job_detail" do
    assert_difference('JobDetail.count', -1) do
      delete job_detail_url(@job_detail)
    end

    assert_redirected_to job_details_url
  end
end
