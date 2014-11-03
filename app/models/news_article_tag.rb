class NewsArticleTag < ActiveRecord::Base
  belongs_to :news_article
  belongs_to :tag
  # attr_accessible :title, :body
end
