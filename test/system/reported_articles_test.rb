require "application_system_test_case"

class ReportedArticlesTest < ApplicationSystemTestCase
  setup do
    @reported_article = reported_articles(:one)
  end

  test "visiting the index" do
    visit reported_articles_url
    assert_selector "h1", text: "Reported articles"
  end

  test "should create reported article" do
    visit reported_articles_url
    click_on "New reported article"

    fill_in "Author", with: @reported_article.author
    fill_in "Category", with: @reported_article.category
    fill_in "Country", with: @reported_article.country
    fill_in "Description", with: @reported_article.description
    fill_in "Link", with: @reported_article.link
    fill_in "Media", with: @reported_article.media
    fill_in "Publication", with: @reported_article.publication
    fill_in "Source", with: @reported_article.source
    fill_in "Summary", with: @reported_article.summary
    fill_in "Title", with: @reported_article.title
    click_on "Create Reported article"

    assert_text "Reported article was successfully created"
    click_on "Back"
  end

  test "should update Reported article" do
    visit reported_article_url(@reported_article)
    click_on "Edit this reported article", match: :first

    fill_in "Author", with: @reported_article.author
    fill_in "Category", with: @reported_article.category
    fill_in "Country", with: @reported_article.country
    fill_in "Description", with: @reported_article.description
    fill_in "Link", with: @reported_article.link
    fill_in "Media", with: @reported_article.media
    fill_in "Publication", with: @reported_article.publication
    fill_in "Source", with: @reported_article.source
    fill_in "Summary", with: @reported_article.summary
    fill_in "Title", with: @reported_article.title
    click_on "Update Reported article"

    assert_text "Reported article was successfully updated"
    click_on "Back"
  end

  test "should destroy Reported article" do
    visit reported_article_url(@reported_article)
    click_on "Destroy this reported article", match: :first

    assert_text "Reported article was successfully destroyed"
  end
end
