require "application_system_test_case"

class EditedPostsTest < ApplicationSystemTestCase
  setup do
    @edited_post = edited_posts(:one)
  end

  test "visiting the index" do
    visit edited_posts_url
    assert_selector "h1", text: "Edited posts"
  end

  test "should create edited post" do
    visit edited_posts_url
    click_on "New edited post"

    click_on "Create Edited post"

    assert_text "Edited post was successfully created"
    click_on "Back"
  end

  test "should update Edited post" do
    visit edited_post_url(@edited_post)
    click_on "Edit this edited post", match: :first

    click_on "Update Edited post"

    assert_text "Edited post was successfully updated"
    click_on "Back"
  end

  test "should destroy Edited post" do
    visit edited_post_url(@edited_post)
    click_on "Destroy this edited post", match: :first

    assert_text "Edited post was successfully destroyed"
  end
end
