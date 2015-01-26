module MainPageHelper
	def articles(news_article)
	  content_tag :div, :class => "col-sm-6" do 
	  	content_tag :div, :class => "container-fluid" do 
	  		content_tag :div, :class => "row-fluid" do 
			    raw( 
			      news_article.collect do |article|
			      	content_tag :div, :class => "well clearfix" do 
			      		 link_to (article.id.eql?(news_article.first.id) ? (image_tag(article.avatar.url, :class => "img_class pull-left") + " " + article.heading) : article.heading), main_page_show_path(:id => article.id), :class => "news_title", :target => "_blank"
			        end
			      end.join
			      )
			  end
		  end
	  end
	end
end

