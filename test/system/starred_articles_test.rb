require "application_system_test_case"

class StarredArticlesTest < ApplicationSystemTestCase
  setup do
    @starred_article = starred_articles(:one)
  end

  test "visiting the index" do
    visit starred_articles_url
    assert_selector "h1", text: "Starred articles"
  end

  test "should create starred article" do
    visit starred_articles_url
    click_on "New starred article"

    click_on "Create Starred article"

    assert_text "Starred article was successfully created"
    click_on "Back"
  end

  test "should update Starred article" do
    visit starred_article_url(@starred_article)
    click_on "Edit this starred article", match: :first

    click_on "Update Starred article"

    assert_text "Starred article was successfully updated"
    click_on "Back"
  end

  test "should destroy Starred article" do
    visit starred_article_url(@starred_article)
    click_on "Destroy this starred article", match: :first

    assert_text "Starred article was successfully destroyed"
  end
end
