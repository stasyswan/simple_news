class TagsController < ApplicationController
  before_filter :set_tag, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, :admin_required

  def index
    find_tags
  end

  def new
    @tag = Tag.new
  end

  def edit
  end

  def create
    @tag = Tag.create(params[:tag])
    find_tags
  end

  def update
    @tag.update_attributes(params[:tag])
    find_tags
  end

  def destroy
    @tag.destroy
    find_tags
    if @tags.length == 0 && params[:page].to_i > 1
      @last_deleted = true
      if @page.present?
        @previous_page = "/tags?page=" +  @page.to_s
      else
        @previous_page = "/tags"
      end
    end
    render :index
  end

  private
    def set_tag
      @tag = Tag.find(params[:id])
    end

    def find_tags
      @tags = Tag.order("created_at desc").page(params[:page])
    end
end
