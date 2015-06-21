require 'test_helper'

class SalesforceControllerTest < ActionController::TestCase
  test "should get callback" do
    get :callback
    assert_response :success
  end

  test "should redirect to root_path" do
  	get :failure
  	assert_redirect_to user_path + '?message=salesforceok'
  end

end
