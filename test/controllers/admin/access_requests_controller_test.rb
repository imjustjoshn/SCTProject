require "test_helper"

class Admin::AccessRequestsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_access_requests_index_url
    assert_response :success
  end

  test "should get update" do
    get admin_access_requests_update_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_access_requests_destroy_url
    assert_response :success
  end
end
