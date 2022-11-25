require "test_helper"

class AdminDashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_dashboard_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_dashboard_show_url
    assert_response :success
  end
end
