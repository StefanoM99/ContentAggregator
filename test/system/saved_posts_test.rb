require "application_system_test_case"

class SavedPostsTest < ApplicationSystemTestCase
  setup do
    @saved_post = saved_posts(:one)
  end

  test "visiting the index" do
    visit saved_posts_url
    assert_selector "h1", text: "Saved posts"
  end

  test "should create saved post" do
    visit saved_posts_url
    click_on "New saved post"

    fill_in "Author", with: @saved_post.author
    fill_in "Image", with: @saved_post.image
    fill_in "Summary", with: @saved_post.summary
    fill_in "Title", with: @saved_post.title
    fill_in "Type", with: @saved_post.type
    fill_in "Video", with: @saved_post.video
    click_on "Create Saved post"

    assert_text "Saved post was successfully created"
    click_on "Back"
  end

  test "should update Saved post" do
    visit saved_post_url(@saved_post)
    click_on "Edit this saved post", match: :first

    fill_in "Author", with: @saved_post.author
    fill_in "Image", with: @saved_post.image
    fill_in "Summary", with: @saved_post.summary
    fill_in "Title", with: @saved_post.title
    fill_in "Type", with: @saved_post.type
    fill_in "Video", with: @saved_post.video
    click_on "Update Saved post"

    assert_text "Saved post was successfully updated"
    click_on "Back"
  end

  test "should destroy Saved post" do
    visit saved_post_url(@saved_post)
    click_on "Destroy this saved post", match: :first

    assert_text "Saved post was successfully destroyed"
  end
end
