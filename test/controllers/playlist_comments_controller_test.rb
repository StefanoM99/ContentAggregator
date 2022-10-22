require "test_helper"

class PlaylistCommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @playlist_comment = playlist_comments(:one)
  end

  test "should get index" do
    get playlist_comments_url
    assert_response :success
  end

  test "should get new" do
    get new_playlist_comment_url
    assert_response :success
  end

  test "should create playlist_comment" do
    assert_difference("PlaylistComment.count") do
      post playlist_comments_url, params: { playlist_comment: { author: @playlist_comment.author, description: @playlist_comment.description } }
    end

    assert_redirected_to playlist_comment_url(PlaylistComment.last)
  end

  test "should show playlist_comment" do
    get playlist_comment_url(@playlist_comment)
    assert_response :success
  end

  test "should get edit" do
    get edit_playlist_comment_url(@playlist_comment)
    assert_response :success
  end

  test "should update playlist_comment" do
    patch playlist_comment_url(@playlist_comment), params: { playlist_comment: { author: @playlist_comment.author, description: @playlist_comment.description } }
    assert_redirected_to playlist_comment_url(@playlist_comment)
  end

  test "should destroy playlist_comment" do
    assert_difference("PlaylistComment.count", -1) do
      delete playlist_comment_url(@playlist_comment)
    end

    assert_redirected_to playlist_comments_url
  end
end
