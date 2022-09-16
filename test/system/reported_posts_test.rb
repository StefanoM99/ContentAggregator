require "application_system_test_case"

class ReportedPostsTest < ApplicationSystemTestCase
  setup do
    @reported_post = reported_posts(:one)
  end

  test "visiting the index" do
    visit reported_posts_url
    assert_selector "h1", text: "Reported posts"
  end

  test "should create reported post" do
    visit reported_posts_url
    click_on "New reported post"

    fill_in "Author", with: @reported_post.author
    fill_in "Summary", with: @reported_post.summary
    fill_in "Title", with: @reported_post.title
    click_on "Create Reported post"

    assert_text "Reported post was successfully created"
    click_on "Back"
  end

  test "should update Reported post" do
    visit reported_post_url(@reported_post)
    click_on "Edit this reported post", match: :first

    fill_in "Author", with: @reported_post.author
    fill_in "Summary", with: @reported_post.summary
    fill_in "Title", with: @reported_post.title
    click_on "Update Reported post"

    assert_text "Reported post was successfully updated"
    click_on "Back"
  end

  test "should destroy Reported post" do
    visit reported_post_url(@reported_post)
    click_on "Destroy this reported post", match: :first

    assert_text "Reported post was successfully destroyed"
  end
end
