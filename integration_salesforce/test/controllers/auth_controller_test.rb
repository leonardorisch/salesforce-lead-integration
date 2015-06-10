require 'test_helper'

class AuthControllerTest < ActionController::TestCase
  test "should get salesforce" do
    get :salesforce
    assert_response :success
  end

  test "should get callback" do
    get :callback
    assert_response :success
  end

end
