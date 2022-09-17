require "test_helper"

class ReportedArticlesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @reported_article = reported_articles(:one)
  end

  test "should get index" do
    get reported_articles_url
    assert_response :success
  end

  test "should get new" do
    get new_reported_article_url
    assert_response :success
  end

  test "should create reported_article" do
    assert_difference("ReportedArticle.count") do
      post reported_articles_url, params: { reported_article: { author: @reported_article.author, category: @reported_article.category, country: @reported_article.country, description: @reported_article.description, link: @reported_article.link, media: @reported_article.media, publication: @reported_article.publication, source: @reported_article.source, summary: @reported_article.summary, title: @reported_article.title } }
    end

    assert_redirected_to reported_article_url(ReportedArticle.last)
  end

  test "should show reported_article" do
    get reported_article_url(@reported_article)
    assert_response :success
  end

  test "should get edit" do
    get edit_reported_article_url(@reported_article)
    assert_response :success
  end

  test "should update reported_article" do
    patch reported_article_url(@reported_article), params: { reported_article: { author: @reported_article.author, category: @reported_article.category, country: @reported_article.country, description: @reported_article.description, link: @reported_article.link, media: @reported_article.media, publication: @reported_article.publication, source: @reported_article.source, summary: @reported_article.summary, title: @reported_article.title } }
    assert_redirected_to reported_article_url(@reported_article)
  end

  test "should destroy reported_article" do
    assert_difference("ReportedArticle.count", -1) do
      delete reported_article_url(@reported_article)
    end

    assert_redirected_to reported_articles_url
  end
end
