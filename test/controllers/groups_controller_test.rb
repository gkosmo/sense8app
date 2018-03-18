require 'test_helper'

class GroupsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get groups_create_url
    assert_response :success
  end

end
