class MainPageController < ApplicationController
	layout "user_layout"
  def index
  	@news_articles_even_last = NewsArticle.where("id%2 = 0").last
  	@news_articles_odd_last = NewsArticle.where("id%2 <> 0").last
  	@news_articles_even = NewsArticle.where("id%2 = 0 and id not in (?)", [@news_articles_even_last.id]).last(4)
  	@news_articles_odd = NewsArticle.where("id%2 <> 0 and id not in (?)", [@news_articles_odd_last.id]).last(4)
  end

  def show_news_tag
  	@news_articles = Tag.find(params[:id]).news_articles
  end

  def show
  	@news_article = NewsArticle.find(params[:id])
  end
end
