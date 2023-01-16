require "test_helper"

class OndemandNetsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get ondemand_nets_index_url
    assert_response :success
  end

  test "should get show" do
    get ondemand_nets_show_url
    assert_response :success
  end

  test "should get new" do
    get ondemand_nets_new_url
    assert_response :success
  end

  test "should get edit" do
    get ondemand_nets_edit_url
    assert_response :success
  end

  test "should get create" do
    get ondemand_nets_create_url
    assert_response :success
  end

  test "should get update" do
    get ondemand_nets_update_url
    assert_response :success
  end

  test "should get destroy" do
    get ondemand_nets_destroy_url
    assert_response :success
  end
end
