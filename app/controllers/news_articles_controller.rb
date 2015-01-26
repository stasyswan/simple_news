class NewsArticlesController < ApplicationController
  before_filter :set_news_article, only: [:show, :edit, :update, :destroy, :add_tag, :destroy_tag]
  before_filter :authenticate_user!, :admin_required

  def index
    find_news
  end

  def show
    @news_article_tag = NewsArticleTag.new
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
    @page = params[:page].to_i
    @previous_page = find_prev_page @news_articles, @page
    render :index
  end

  def destroy_tag
    NewsArticleTag.where(:news_article_id => @news_article.id, :tag_id => params[:tag_id]).first.destroy

    render :show
  end

  def add_tag
    params[:news_article_tag][:tags_tokens].split(",").each do |t|
      NewsArticleTag.create(:news_article_id => @news_article.id, :tag_id => t.to_i)
    end
    @news_article_tag = NewsArticleTag.new
    redirect_to news_article_path(@news_article.id)
  end

  def token
    news_with_token_arr = NewsArticleTag.news_with_token(params[:news_article_id]).map{|n| n.tag_id}
    tags = Tag.search(news_with_token_arr, "%" + params[:q] + "%")
   
    respond_to do |format|
      format.json { render :json => tags }
    end
  end

  private
  def set_news_article
    @news_article = NewsArticle.find(params[:id])
  end

  def find_news
    @news_articles = NewsArticle.order("created_at desc").page(params[:page].to_i.eql?(0) ? 1 : params[:page].to_i)
  end

  def find_prev_page news_articles, page
    if news_articles.length == 0 && page && page  > 1
      @last_deleted = true
      if page.present?
        "/news_articles?page=" + (page - 1).to_s
      else
        "/news_articles"
      end
    end
  end
end
