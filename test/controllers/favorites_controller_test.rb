require 'test_helper'

class FavoritesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get favorites_create_url
    assert_response :success
  end

end
