require 'test_helper'

class GymControllerTest < ActionDispatch::IntegrationTest
  test "should get name:string" do
    get gym_name:string_url
    assert_response :success
  end

  test "should get user:references" do
    get gym_user:references_url
    assert_response :success
  end

end
