require "application_system_test_case"

class StarredPostsTest < ApplicationSystemTestCase
  setup do
    @starred_post = starred_posts(:one)
  end

  test "visiting the index" do
    visit starred_posts_url
    assert_selector "h1", text: "Starred posts"
  end

  test "should create starred post" do
    visit starred_posts_url
    click_on "New starred post"

    fill_in "Author", with: @starred_post.author
    fill_in "Summary", with: @starred_post.summary
    fill_in "Title", with: @starred_post.title
    click_on "Create Starred post"

    assert_text "Starred post was successfully created"
    click_on "Back"
  end

  test "should update Starred post" do
    visit starred_post_url(@starred_post)
    click_on "Edit this starred post", match: :first

    fill_in "Author", with: @starred_post.author
    fill_in "Summary", with: @starred_post.summary
    fill_in "Title", with: @starred_post.title
    click_on "Update Starred post"

    assert_text "Starred post was successfully updated"
    click_on "Back"
  end

  test "should destroy Starred post" do
    visit starred_post_url(@starred_post)
    click_on "Destroy this starred post", match: :first

    assert_text "Starred post was successfully destroyed"
  end
end
