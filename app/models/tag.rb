class Tag < ActiveRecord::Base
  has_many :news_articles, :through => :news_article_tags
  has_many :news_article_tags

  self.per_page = 3
  
  attr_accessible :name

  validates :name, :presence => true

  def self.search(news_with_token_arr, query)
  	if news_with_token_arr.empty?
       where("name like ?", query).map { |u| {"id" => u.id, "name" => u.name} }
    else
      where("id not in (?) and name like ?", news_with_token_arr, query).map{ |u| {"id" => u.id, "name" => u.name} }
    end
  end
end
