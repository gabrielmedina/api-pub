require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v1_products_url, as: :json
    assert_response :success
  end
end
