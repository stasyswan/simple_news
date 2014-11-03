class NewsArticle < ActiveRecord::Base
  attr_accessible :body, :heading#, :tags_attributes

  validates :heading,  :presence => true
  validates :body, :presence => true

  has_many :tags, :through => :news_article_tags

  #accepts_nested_attributes_for :tags, :allow_destroy => :true,
   # :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }
end
