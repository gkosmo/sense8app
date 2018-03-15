require 'test_helper'

class ClustersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get clusters_show_url
    assert_response :success
  end

end
