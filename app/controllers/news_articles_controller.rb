class NewsArticlesController < ApplicationController
  before_filter :set_news_article, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, :admin_required

  def index
    find_news
  end

  def show
  end

  def new
    @news_article = NewsArticle.new
  end

  def edit
  end

  def create
    @news_article = NewsArticle.new(params[:news_article])
    if @news_article.save
      redirect_to :action => :index
    else
      render :new
    end
  end

  def update
    if @news_article.update_attributes(params[:news_article])
      redirect_to :action => :index
    else
      render :edit
    end
  end

  def destroy
    @news_article.destroy
    find_news
    if @news_articles.length == 0 && params[:page].to_i > 1
      @last_deleted = true
      if @page.present?
        @previous_page = "/news_articles?page=" +  @page.to_s
      else
        @previous_page = "/news_articles"
      end
    end
    render :index
  end

  private
    def set_news_article
      @news_article = NewsArticle.find(params[:id])
    end

    def find_news
      @news_articles = NewsArticle.order("created_at desc").paginate(:per_page => 10, :page => (params[:page].to_i == 0 ? 1 : params[:page].to_i))
    end
end
