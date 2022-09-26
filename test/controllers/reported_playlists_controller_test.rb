require "test_helper"

class ReportedPlaylistsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @reported_playlist = reported_playlists(:one)
  end

  test "should get index" do
    get reported_playlists_url
    assert_response :success
  end

  test "should get new" do
    get new_reported_playlist_url
    assert_response :success
  end

  test "should create reported_playlist" do
    assert_difference("ReportedPlaylist.count") do
      post reported_playlists_url, params: { reported_playlist: {  } }
    end

    assert_redirected_to reported_playlist_url(ReportedPlaylist.last)
  end

  test "should show reported_playlist" do
    get reported_playlist_url(@reported_playlist)
    assert_response :success
  end

  test "should get edit" do
    get edit_reported_playlist_url(@reported_playlist)
    assert_response :success
  end

  test "should update reported_playlist" do
    patch reported_playlist_url(@reported_playlist), params: { reported_playlist: {  } }
    assert_redirected_to reported_playlist_url(@reported_playlist)
  end

  test "should destroy reported_playlist" do
    assert_difference("ReportedPlaylist.count", -1) do
      delete reported_playlist_url(@reported_playlist)
    end

    assert_redirected_to reported_playlists_url
  end
end
