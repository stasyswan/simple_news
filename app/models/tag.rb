class Tag < ActiveRecord::Base
  has_many :news_articles, :through => :news_article_tags
  has_many :news_article_tags
  attr_accessible :name

  validates :name, :presence => true
end
