module ApplicationHelper
	
	def sign_in_out_link
    if current_user
      link_to "<i class='glyphicon glyphicon-off'></i> Sign Out".html_safe, sign_out_path, class: 'navbar-brand pull-right'
    else
      link_to "<i class='icon-user'></i> Sign In".html_safe, sign_in_path, class: 'navbar-brand pull-right'
    end
	end
end
