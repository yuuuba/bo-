require "test_helper"

class OndemandsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get ondemands_index_url
    assert_response :success
  end

  test "should get show" do
    get ondemands_show_url
    assert_response :success
  end

  test "should get new" do
    get ondemands_new_url
    assert_response :success
  end

  test "should get edit" do
    get ondemands_edit_url
    assert_response :success
  end

  test "should get create" do
    get ondemands_create_url
    assert_response :success
  end

  test "should get update" do
    get ondemands_update_url
    assert_response :success
  end

  test "should get destroy" do
    get ondemands_destroy_url
    assert_response :success
  end
end
