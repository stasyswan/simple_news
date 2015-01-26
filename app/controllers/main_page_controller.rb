class MainPageController < ApplicationController
	layout "user_layout"
  def index
  	@news_articles_even = NewsArticle.even.order("created_at desc").last(5)
  	@news_articles_odd = NewsArticle.odd.order("created_at desc").last(5)
  end

  def show_news_tag
  	@news_articles = Tag.find(params[:id]).news_articles
  end

  def show
  	@news_article = NewsArticle.find(params[:id])
  end
end
