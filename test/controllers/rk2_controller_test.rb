require "test_helper"

class Rk2ControllerTest < ActionDispatch::IntegrationTest
  test "should get input" do
    get rk2_input_url
    assert_response :success
  end

  test "should get view" do
    get rk2_view_url
    assert_response :success
  end
end
