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
    query = "%" + params[:q] + "%"
    news_with_token = NewsArticleTag.where(:news_article_id => params[:news_article_id]).map{|n| n.tag_id}
    if news_with_token == []
       tags = Tag.where("name like ?", query).map { |u| {"id" => u.id, "name" => u.name} }
    else
      tags = Tag.where("id not in (?)", news_with_token).where("name like ?", query).map { |u| {"id" => u.id, "name" => u.name} }
    end
   
    respond_to do |format|
      format.json { render :json => tags }
    end
  end

  private
    def set_news_article
      @news_article = NewsArticle.find(params[:id])
    end

    def find_news
      @news_articles = NewsArticle.order("created_at desc").paginate(:per_page => 10, :page => (params[:page].to_i == 0 ? 1 : params[:page].to_i))
    end
end
