require 'test_helper'

class PublicsControllerTest < ActionController::TestCase
  test "should get login" do
    get :login
    assert_response :success
  end

  test "should get redirect" do
    get :redirect
    assert_response :success
  end

end
