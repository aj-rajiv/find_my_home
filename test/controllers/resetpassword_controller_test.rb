require 'test_helper'

class ResetpasswordControllerTest < ActionDispatch::IntegrationTest
  test "should get forgot" do
    get resetpassword_forgot_url
    assert_response :success
  end

end
