require "test_helper"

class Admin::ReciewCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get destroy" do
    get admin_reciew_comments_destroy_url
    assert_response :success
  end
end
