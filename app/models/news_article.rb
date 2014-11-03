class NewsArticle < ActiveRecord::Base
  attr_accessible :body, :heading, :avatar
  


  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  validates :heading,  :presence => true
  validates :body, :presence => true

  has_many :tags, :through => :news_article_tags
  has_many :news_article_tags
end
