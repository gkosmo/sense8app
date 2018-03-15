require 'test_helper'

class EducationsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get educations_create_url
    assert_response :success
  end

  test "should get update" do
    get educations_update_url
    assert_response :success
  end

  test "should get destroy" do
    get educations_destroy_url
    assert_response :success
  end

end
