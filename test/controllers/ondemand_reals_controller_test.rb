require "test_helper"

class OndemandRealsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get ondemand_reals_index_url
    assert_response :success
  end

  test "should get show" do
    get ondemand_reals_show_url
    assert_response :success
  end

  test "should get new" do
    get ondemand_reals_new_url
    assert_response :success
  end

  test "should get edit" do
    get ondemand_reals_edit_url
    assert_response :success
  end

  test "should get create" do
    get ondemand_reals_create_url
    assert_response :success
  end

  test "should get update" do
    get ondemand_reals_update_url
    assert_response :success
  end

  test "should get destroy" do
    get ondemand_reals_destroy_url
    assert_response :success
  end
end
