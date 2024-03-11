require "test_helper"

class RetrievedArticlesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @retrieved_article = retrieved_articles(:one)
  end

  test "should get index" do
    get retrieved_articles_url, as: :json
    assert_response :success
  end

  test "should create retrieved_article" do
    assert_difference("RetrievedArticle.count") do
      post retrieved_articles_url, params: { retrieved_article: {  } }, as: :json
    end

    assert_response :created
  end

  test "should show retrieved_article" do
    get retrieved_article_url(@retrieved_article), as: :json
    assert_response :success
  end

  test "should update retrieved_article" do
    patch retrieved_article_url(@retrieved_article), params: { retrieved_article: {  } }, as: :json
    assert_response :success
  end

  test "should destroy retrieved_article" do
    assert_difference("RetrievedArticle.count", -1) do
      delete retrieved_article_url(@retrieved_article), as: :json
    end

    assert_response :no_content
  end
end
