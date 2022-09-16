require "test_helper"

class StarredArticlesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @starred_article = starred_articles(:one)
  end

  test "should get index" do
    get starred_articles_url
    assert_response :success
  end

  test "should get new" do
    get new_starred_article_url
    assert_response :success
  end

  test "should create starred_article" do
    assert_difference("StarredArticle.count") do
      post starred_articles_url, params: { starred_article: { author: @starred_article.author, category: @starred_article.category, country: @starred_article.country, description: @starred_article.description, link: @starred_article.link, media: @starred_article.media, publication: @starred_article.publication, source: @starred_article.source, summary: @starred_article.summary, title: @starred_article.title } }
    end

    assert_redirected_to starred_article_url(StarredArticle.last)
  end

  test "should show starred_article" do
    get starred_article_url(@starred_article)
    assert_response :success
  end

  test "should get edit" do
    get edit_starred_article_url(@starred_article)
    assert_response :success
  end

  test "should update starred_article" do
    patch starred_article_url(@starred_article), params: { starred_article: { author: @starred_article.author, category: @starred_article.category, country: @starred_article.country, description: @starred_article.description, link: @starred_article.link, media: @starred_article.media, publication: @starred_article.publication, source: @starred_article.source, summary: @starred_article.summary, title: @starred_article.title } }
    assert_redirected_to starred_article_url(@starred_article)
  end

  test "should destroy starred_article" do
    assert_difference("StarredArticle.count", -1) do
      delete starred_article_url(@starred_article)
    end

    assert_redirected_to starred_articles_url
  end
end
