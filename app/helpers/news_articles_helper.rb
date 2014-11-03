module NewsArticlesHelper
	def join_tags(news_article)
	 	news_article.tags.map { |t| t.name }.join(", ")
	end
end
