require 'test_helper'

class Administration::NewsArticlesControllerTest < ActionController::TestCase
  setup do
    @administration_news_article = administration_news_articles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:administration_news_articles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create administration_news_article" do
    assert_difference('Administration::NewsArticle.count') do
      post :create, administration_news_article: { body: @administration_news_article.body, heading: @administration_news_article.heading }
    end

    assert_redirected_to administration_news_article_path(assigns(:administration_news_article))
  end

  test "should show administration_news_article" do
    get :show, id: @administration_news_article
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @administration_news_article
    assert_response :success
  end

  test "should update administration_news_article" do
    put :update, id: @administration_news_article, administration_news_article: { body: @administration_news_article.body, heading: @administration_news_article.heading }
    assert_redirected_to administration_news_article_path(assigns(:administration_news_article))
  end

  test "should destroy administration_news_article" do
    assert_difference('Administration::NewsArticle.count', -1) do
      delete :destroy, id: @administration_news_article
    end

    assert_redirected_to administration_news_articles_path
  end
end
