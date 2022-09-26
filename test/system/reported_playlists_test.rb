require "application_system_test_case"

class ReportedPlaylistsTest < ApplicationSystemTestCase
  setup do
    @reported_playlist = reported_playlists(:one)
  end

  test "visiting the index" do
    visit reported_playlists_url
    assert_selector "h1", text: "Reported playlists"
  end

  test "should create reported playlist" do
    visit reported_playlists_url
    click_on "New reported playlist"

    click_on "Create Reported playlist"

    assert_text "Reported playlist was successfully created"
    click_on "Back"
  end

  test "should update Reported playlist" do
    visit reported_playlist_url(@reported_playlist)
    click_on "Edit this reported playlist", match: :first

    click_on "Update Reported playlist"

    assert_text "Reported playlist was successfully updated"
    click_on "Back"
  end

  test "should destroy Reported playlist" do
    visit reported_playlist_url(@reported_playlist)
    click_on "Destroy this reported playlist", match: :first

    assert_text "Reported playlist was successfully destroyed"
  end
end
