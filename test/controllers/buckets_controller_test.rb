require "test_helper"

class BucketsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get buckets_show_url
    assert_response :success
  end

  test "should get add_product" do
    get buckets_add_product_url
    assert_response :success
  end

  test "should get remove_product" do
    get buckets_remove_product_url
    assert_response :success
  end

  test "should get update_quantity" do
    get buckets_update_quantity_url
    assert_response :success
  end
end
