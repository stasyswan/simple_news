class Administration::AdminController < ApplicationController
	before_filter :authenticate_user!, :admin_required
	
  def index
  end
end
