require "application_system_test_case"

class SavedArticlesTest < ApplicationSystemTestCase
  setup do
    @saved_article = saved_articles(:one)
  end

  test "visiting the index" do
    visit saved_articles_url
    assert_selector "h1", text: "Saved articles"
  end

  test "should create saved article" do
    visit saved_articles_url
    click_on "New saved article"

    fill_in "Author", with: @saved_article.author
    fill_in "Category", with: @saved_article.category
    fill_in "Country", with: @saved_article.country
    fill_in "Description", with: @saved_article.description
    fill_in "Link", with: @saved_article.link
    fill_in "Media", with: @saved_article.media
    fill_in "Publication", with: @saved_article.publication
    fill_in "Source", with: @saved_article.source
    fill_in "Summary", with: @saved_article.summary
    fill_in "Title", with: @saved_article.title
    fill_in "Type", with: @saved_article.type
    click_on "Create Saved article"

    assert_text "Saved article was successfully created"
    click_on "Back"
  end

  test "should update Saved article" do
    visit saved_article_url(@saved_article)
    click_on "Edit this saved article", match: :first

    fill_in "Author", with: @saved_article.author
    fill_in "Category", with: @saved_article.category
    fill_in "Country", with: @saved_article.country
    fill_in "Description", with: @saved_article.description
    fill_in "Link", with: @saved_article.link
    fill_in "Media", with: @saved_article.media
    fill_in "Publication", with: @saved_article.publication
    fill_in "Source", with: @saved_article.source
    fill_in "Summary", with: @saved_article.summary
    fill_in "Title", with: @saved_article.title
    fill_in "Type", with: @saved_article.type
    click_on "Update Saved article"

    assert_text "Saved article was successfully updated"
    click_on "Back"
  end

  test "should destroy Saved article" do
    visit saved_article_url(@saved_article)
    click_on "Destroy this saved article", match: :first

    assert_text "Saved article was successfully destroyed"
  end
end
