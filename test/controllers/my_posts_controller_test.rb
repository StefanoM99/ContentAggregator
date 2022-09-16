require "test_helper"

class MyPostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @my_post = my_posts(:one)
  end

  test "should get index" do
    get my_posts_url
    assert_response :success
  end

  test "should get new" do
    get new_my_post_url
    assert_response :success
  end

  test "should create my_post" do
    assert_difference("MyPost.count") do
      post my_posts_url, params: { my_post: { author: @my_post.author, summary: @my_post.summary, title: @my_post.title } }
    end

    assert_redirected_to my_post_url(MyPost.last)
  end

  test "should show my_post" do
    get my_post_url(@my_post)
    assert_response :success
  end

  test "should get edit" do
    get edit_my_post_url(@my_post)
    assert_response :success
  end

  test "should update my_post" do
    patch my_post_url(@my_post), params: { my_post: { author: @my_post.author, summary: @my_post.summary, title: @my_post.title } }
    assert_redirected_to my_post_url(@my_post)
  end

  test "should destroy my_post" do
    assert_difference("MyPost.count", -1) do
      delete my_post_url(@my_post)
    end

    assert_redirected_to my_posts_url
  end
end
