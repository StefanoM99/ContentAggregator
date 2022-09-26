require "test_helper"

class SavedPlaylistsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @saved_playlist = saved_playlists(:one)
  end

  test "should get index" do
    get saved_playlists_url
    assert_response :success
  end

  test "should get new" do
    get new_saved_playlist_url
    assert_response :success
  end

  test "should create saved_playlist" do
    assert_difference("SavedPlaylist.count") do
      post saved_playlists_url, params: { saved_playlist: { description: @saved_playlist.description, name: @saved_playlist.name, spotify_img: @saved_playlist.spotify_img, spotify_url: @saved_playlist.spotify_url, type: @saved_playlist.type } }
    end

    assert_redirected_to saved_playlist_url(SavedPlaylist.last)
  end

  test "should show saved_playlist" do
    get saved_playlist_url(@saved_playlist)
    assert_response :success
  end

  test "should get edit" do
    get edit_saved_playlist_url(@saved_playlist)
    assert_response :success
  end

  test "should update saved_playlist" do
    patch saved_playlist_url(@saved_playlist), params: { saved_playlist: { description: @saved_playlist.description, name: @saved_playlist.name, spotify_img: @saved_playlist.spotify_img, spotify_url: @saved_playlist.spotify_url, type: @saved_playlist.type } }
    assert_redirected_to saved_playlist_url(@saved_playlist)
  end

  test "should destroy saved_playlist" do
    assert_difference("SavedPlaylist.count", -1) do
      delete saved_playlist_url(@saved_playlist)
    end

    assert_redirected_to saved_playlists_url
  end
end
