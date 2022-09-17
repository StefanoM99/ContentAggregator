require "test_helper"

class EditedPostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @edited_post = edited_posts(:one)
  end

  test "should get index" do
    get edited_posts_url
    assert_response :success
  end

  test "should get new" do
    get new_edited_post_url
    assert_response :success
  end

  test "should create edited_post" do
    assert_difference("EditedPost.count") do
      post edited_posts_url, params: { edited_post: { author: @edited_post.author, summary: @edited_post.summary, title: @edited_post.title } }
    end

    assert_redirected_to edited_post_url(EditedPost.last)
  end

  test "should show edited_post" do
    get edited_post_url(@edited_post)
    assert_response :success
  end

  test "should get edit" do
    get edit_edited_post_url(@edited_post)
    assert_response :success
  end

  test "should update edited_post" do
    patch edited_post_url(@edited_post), params: { edited_post: { author: @edited_post.author, summary: @edited_post.summary, title: @edited_post.title } }
    assert_redirected_to edited_post_url(@edited_post)
  end

  test "should destroy edited_post" do
    assert_difference("EditedPost.count", -1) do
      delete edited_post_url(@edited_post)
    end

    assert_redirected_to edited_posts_url
  end
end
