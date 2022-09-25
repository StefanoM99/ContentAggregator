require "test_helper"

class ReportedPostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @reported_post = reported_posts(:one)
  end

  test "should get index" do
    get reported_posts_url
    assert_response :success
  end

  test "should get new" do
    get new_reported_post_url
    assert_response :success
  end

  test "should create reported_post" do
    assert_difference("ReportedPost.count") do
      post reported_posts_url, params: { reported_post: {  } }
    end

    assert_redirected_to reported_post_url(ReportedPost.last)
  end

  test "should show reported_post" do
    get reported_post_url(@reported_post)
    assert_response :success
  end

  test "should get edit" do
    get edit_reported_post_url(@reported_post)
    assert_response :success
  end

  test "should update reported_post" do
    patch reported_post_url(@reported_post), params: { reported_post: {  } }
    assert_redirected_to reported_post_url(@reported_post)
  end

  test "should destroy reported_post" do
    assert_difference("ReportedPost.count", -1) do
      delete reported_post_url(@reported_post)
    end

    assert_redirected_to reported_posts_url
  end
end
