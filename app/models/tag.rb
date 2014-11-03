class Tag < ActiveRecord::Base
  has_many :news_article, :through => :news_article_tags
  attr_accessible :name

  validates :name, :presence => true
end
