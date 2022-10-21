require "test_helper"

class PageTestControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get page_test_home_url
    assert_response :success
  end
end
