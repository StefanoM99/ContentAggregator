require "application_system_test_case"

class StarredPlaylistsTest < ApplicationSystemTestCase
  setup do
    @starred_playlist = starred_playlists(:one)
  end

  test "visiting the index" do
    visit starred_playlists_url
    assert_selector "h1", text: "Starred playlists"
  end

  test "should create starred playlist" do
    visit starred_playlists_url
    click_on "New starred playlist"

    click_on "Create Starred playlist"

    assert_text "Starred playlist was successfully created"
    click_on "Back"
  end

  test "should update Starred playlist" do
    visit starred_playlist_url(@starred_playlist)
    click_on "Edit this starred playlist", match: :first

    click_on "Update Starred playlist"

    assert_text "Starred playlist was successfully updated"
    click_on "Back"
  end

  test "should destroy Starred playlist" do
    visit starred_playlist_url(@starred_playlist)
    click_on "Destroy this starred playlist", match: :first

    assert_text "Starred playlist was successfully destroyed"
  end
end
