class NewsArticleTag < ActiveRecord::Base
  belongs_to :news_article
  belongs_to :tag

  attr_accessible :news_article_id, :tag_id
    attr_accessor :tags_tokens
  

end
