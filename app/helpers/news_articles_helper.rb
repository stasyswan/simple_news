module NewsArticlesHelper
	def join_tags(news_article)
	 	news_article.tags.map { |t| t.name }.join(", ")
	end

	def join_tags_link(news_article)
	 	news_article.tags.map { |t| link_to(t.name, main_page_show_news_tag_path(:id => t.id), :target => "_blank")}.join(", ").html_safe 
	end
end
