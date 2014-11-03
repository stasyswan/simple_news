class ApplicationController < ActionController::Base
  protect_from_forgery

  def after_sign_in_path_for(resource)
    if resource.admin?
      dashboard_path
    else
      root_path
    end
  end

  def admin_required
    redirect_to '/' unless current_user.admin?
  end
end
