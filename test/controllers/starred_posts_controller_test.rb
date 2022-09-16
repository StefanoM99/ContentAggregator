require "test_helper"

class StarredPostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @starred_post = starred_posts(:one)
  end

  test "should get index" do
    get starred_posts_url
    assert_response :success
  end

  test "should get new" do
    get new_starred_post_url
    assert_response :success
  end

  test "should create starred_post" do
    assert_difference("StarredPost.count") do
      post starred_posts_url, params: { starred_post: { author: @starred_post.author, summary: @starred_post.summary, title: @starred_post.title } }
    end

    assert_redirected_to starred_post_url(StarredPost.last)
  end

  test "should show starred_post" do
    get starred_post_url(@starred_post)
    assert_response :success
  end

  test "should get edit" do
    get edit_starred_post_url(@starred_post)
    assert_response :success
  end

  test "should update starred_post" do
    patch starred_post_url(@starred_post), params: { starred_post: { author: @starred_post.author, summary: @starred_post.summary, title: @starred_post.title } }
    assert_redirected_to starred_post_url(@starred_post)
  end

  test "should destroy starred_post" do
    assert_difference("StarredPost.count", -1) do
      delete starred_post_url(@starred_post)
    end

    assert_redirected_to starred_posts_url
  end
end
