require "test_helper"

class StarredPlaylistsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @starred_playlist = starred_playlists(:one)
  end

  test "should get index" do
    get starred_playlists_url
    assert_response :success
  end

  test "should get new" do
    get new_starred_playlist_url
    assert_response :success
  end

  test "should create starred_playlist" do
    assert_difference("StarredPlaylist.count") do
      post starred_playlists_url, params: { starred_playlist: {  } }
    end

    assert_redirected_to starred_playlist_url(StarredPlaylist.last)
  end

  test "should show starred_playlist" do
    get starred_playlist_url(@starred_playlist)
    assert_response :success
  end

  test "should get edit" do
    get edit_starred_playlist_url(@starred_playlist)
    assert_response :success
  end

  test "should update starred_playlist" do
    patch starred_playlist_url(@starred_playlist), params: { starred_playlist: {  } }
    assert_redirected_to starred_playlist_url(@starred_playlist)
  end

  test "should destroy starred_playlist" do
    assert_difference("StarredPlaylist.count", -1) do
      delete starred_playlist_url(@starred_playlist)
    end

    assert_redirected_to starred_playlists_url
  end
end
