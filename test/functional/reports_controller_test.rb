require 'test_helper'

class ReportsControllerTest < ActionController::TestCase
  test "should get carousel" do
    get :carousel
    assert_response :success
  end

  test "should get heat_map" do
    get :heat_map
    assert_response :success
  end

  test "should get google_map" do
    get :google_map
    assert_response :success
  end

end
