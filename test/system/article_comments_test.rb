require "application_system_test_case"

class ArticleCommentsTest < ApplicationSystemTestCase
  setup do
    @article_comment = article_comments(:one)
  end

  test "visiting the index" do
    visit article_comments_url
    assert_selector "h1", text: "Article comments"
  end

  test "should create article comment" do
    visit article_comments_url
    click_on "New article comment"

    fill_in "Author", with: @article_comment.author
    fill_in "Description", with: @article_comment.description
    click_on "Create Article comment"

    assert_text "Article comment was successfully created"
    click_on "Back"
  end

  test "should update Article comment" do
    visit article_comment_url(@article_comment)
    click_on "Edit this article comment", match: :first

    fill_in "Author", with: @article_comment.author
    fill_in "Description", with: @article_comment.description
    click_on "Update Article comment"

    assert_text "Article comment was successfully updated"
    click_on "Back"
  end

  test "should destroy Article comment" do
    visit article_comment_url(@article_comment)
    click_on "Destroy this article comment", match: :first

    assert_text "Article comment was successfully destroyed"
  end
end
