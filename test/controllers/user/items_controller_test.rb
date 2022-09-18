require "test_helper"

class User::ItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get search" do
    get user_items_search_url
    assert_response :success
  end
end
