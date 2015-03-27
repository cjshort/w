require 'test_helper'

class PanelsControllerTest < ActionController::TestCase
  test "should get dashboard" do
    get :dashboard
    assert_response :success
  end

  test "should get humans" do
    get :humans
    assert_response :success
  end

end
