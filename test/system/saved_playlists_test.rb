require "application_system_test_case"

class SavedPlaylistsTest < ApplicationSystemTestCase
  setup do
    @saved_playlist = saved_playlists(:one)
  end

  test "visiting the index" do
    visit saved_playlists_url
    assert_selector "h1", text: "Saved playlists"
  end

  test "should create saved playlist" do
    visit saved_playlists_url
    click_on "New saved playlist"

    fill_in "Description", with: @saved_playlist.description
    fill_in "Name", with: @saved_playlist.name
    fill_in "Spotify img", with: @saved_playlist.spotify_img
    fill_in "Spotify url", with: @saved_playlist.spotify_url
    fill_in "Type", with: @saved_playlist.type
    click_on "Create Saved playlist"

    assert_text "Saved playlist was successfully created"
    click_on "Back"
  end

  test "should update Saved playlist" do
    visit saved_playlist_url(@saved_playlist)
    click_on "Edit this saved playlist", match: :first

    fill_in "Description", with: @saved_playlist.description
    fill_in "Name", with: @saved_playlist.name
    fill_in "Spotify img", with: @saved_playlist.spotify_img
    fill_in "Spotify url", with: @saved_playlist.spotify_url
    fill_in "Type", with: @saved_playlist.type
    click_on "Update Saved playlist"

    assert_text "Saved playlist was successfully updated"
    click_on "Back"
  end

  test "should destroy Saved playlist" do
    visit saved_playlist_url(@saved_playlist)
    click_on "Destroy this saved playlist", match: :first

    assert_text "Saved playlist was successfully destroyed"
  end
end
