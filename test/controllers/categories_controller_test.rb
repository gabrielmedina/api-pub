require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v1_categories_url, as: :json
    assert_response :success
  end
end
