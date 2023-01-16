require "test_helper"

class OndemandCategoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get ondemand_categories_index_url
    assert_response :success
  end

  test "should get show" do
    get ondemand_categories_show_url
    assert_response :success
  end

  test "should get new" do
    get ondemand_categories_new_url
    assert_response :success
  end

  test "should get edit" do
    get ondemand_categories_edit_url
    assert_response :success
  end

  test "should get create" do
    get ondemand_categories_create_url
    assert_response :success
  end

  test "should get update" do
    get ondemand_categories_update_url
    assert_response :success
  end

  test "should get destroy" do
    get ondemand_categories_destroy_url
    assert_response :success
  end
end
