require "application_system_test_case"

class PlaylistCommentsTest < ApplicationSystemTestCase
  setup do
    @playlist_comment = playlist_comments(:one)
  end

  test "visiting the index" do
    visit playlist_comments_url
    assert_selector "h1", text: "Playlist comments"
  end

  test "should create playlist comment" do
    visit playlist_comments_url
    click_on "New playlist comment"

    fill_in "Author", with: @playlist_comment.author
    fill_in "Description", with: @playlist_comment.description
    click_on "Create Playlist comment"

    assert_text "Playlist comment was successfully created"
    click_on "Back"
  end

  test "should update Playlist comment" do
    visit playlist_comment_url(@playlist_comment)
    click_on "Edit this playlist comment", match: :first

    fill_in "Author", with: @playlist_comment.author
    fill_in "Description", with: @playlist_comment.description
    click_on "Update Playlist comment"

    assert_text "Playlist comment was successfully updated"
    click_on "Back"
  end

  test "should destroy Playlist comment" do
    visit playlist_comment_url(@playlist_comment)
    click_on "Destroy this playlist comment", match: :first

    assert_text "Playlist comment was successfully destroyed"
  end
end
