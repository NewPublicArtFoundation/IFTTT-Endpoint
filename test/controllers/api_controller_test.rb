require 'test_helper'

class ApiControllerTest < ActionController::TestCase
  test "should get status" do
    get :status
    assert_response :success
  end

end
