require "application_system_test_case"

class MyPostsTest < ApplicationSystemTestCase
  setup do
    @my_post = my_posts(:one)
  end

  test "visiting the index" do
    visit my_posts_url
    assert_selector "h1", text: "My posts"
  end

  test "should create my post" do
    visit my_posts_url
    click_on "New my post"

    fill_in "Author", with: @my_post.author
    fill_in "Summary", with: @my_post.summary
    fill_in "Title", with: @my_post.title
    click_on "Create My post"

    assert_text "My post was successfully created"
    click_on "Back"
  end

  test "should update My post" do
    visit my_post_url(@my_post)
    click_on "Edit this my post", match: :first

    fill_in "Author", with: @my_post.author
    fill_in "Summary", with: @my_post.summary
    fill_in "Title", with: @my_post.title
    click_on "Update My post"

    assert_text "My post was successfully updated"
    click_on "Back"
  end

  test "should destroy My post" do
    visit my_post_url(@my_post)
    click_on "Destroy this my post", match: :first

    assert_text "My post was successfully destroyed"
  end
end
