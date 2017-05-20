require 'test_helper'

class LoginsControllerTest < ActionDispatch::IntegrationTest
  test "should get log" do
    get logins_log_url
    assert_response :success
  end

end
