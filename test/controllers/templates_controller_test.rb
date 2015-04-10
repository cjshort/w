require 'test_helper'

class TemplatesControllerTest < ActionController::TestCase
  test "should get login_one" do
    get :login_one
    assert_response :success
  end

  test "should get login_two" do
    get :login_two
    assert_response :success
  end

  test "should get login_three" do
    get :login_three
    assert_response :success
  end

end
