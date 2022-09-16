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

    fill_in "Author", with: @starred_article.author
    fill_in "Category", with: @starred_article.category
    fill_in "Country", with: @starred_article.country
    fill_in "Description", with: @starred_article.description
    fill_in "Link", with: @starred_article.link
    fill_in "Media", with: @starred_article.media
    fill_in "Publication", with: @starred_article.publication
    fill_in "Source", with: @starred_article.source
    fill_in "Summary", with: @starred_article.summary
    fill_in "Title", with: @starred_article.title
    click_on "Create Starred article"

    assert_text "Starred article was successfully created"
    click_on "Back"
  end

  test "should update Starred article" do
    visit starred_article_url(@starred_article)
    click_on "Edit this starred article", match: :first

    fill_in "Author", with: @starred_article.author
    fill_in "Category", with: @starred_article.category
    fill_in "Country", with: @starred_article.country
    fill_in "Description", with: @starred_article.description
    fill_in "Link", with: @starred_article.link
    fill_in "Media", with: @starred_article.media
    fill_in "Publication", with: @starred_article.publication
    fill_in "Source", with: @starred_article.source
    fill_in "Summary", with: @starred_article.summary
    fill_in "Title", with: @starred_article.title
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
