require 'test_helper'

class ReceiptsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get receipts_index_url
    assert_response :success
  end

  test "should get show" do
    get receipts_show_url
    assert_response :success
  end

  test "should get new" do
    get receipts_new_url
    assert_response :success
  end

  test "should get create" do
    get receipts_create_url
    assert_response :success
  end

  test "should get destroy" do
    get receipts_destroy_url
    assert_response :success
  end

end
