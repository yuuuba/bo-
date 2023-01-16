require "test_helper"

class CommunityTopicsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get community_topics_index_url
    assert_response :success
  end

  test "should get show" do
    get community_topics_show_url
    assert_response :success
  end

  test "should get new" do
    get community_topics_new_url
    assert_response :success
  end

  test "should get edit" do
    get community_topics_edit_url
    assert_response :success
  end

  test "should get create" do
    get community_topics_create_url
    assert_response :success
  end

  test "should get update" do
    get community_topics_update_url
    assert_response :success
  end

  test "should get destroy" do
    get community_topics_destroy_url
    assert_response :success
  end
end
