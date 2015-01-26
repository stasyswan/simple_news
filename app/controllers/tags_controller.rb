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
    @previous_page = find_prev_page @tags, params[:page].to_i

    render :index
  end

  private
  def set_tag
    @tag = Tag.find(params[:id])
  end

  def find_tags
    @tags = Tag.order("created_at desc").page(params[:page].to_i.eql?(0) ? 1 : params[:page].to_i)
  end

  def find_prev_page tags, page
    if tags.length == 0 && page && page > 1
      @last_deleted = true
      if page.present?
        "/tags?page=" + (page - 1).to_s
      else
        "/tags"
      end
    end
  end
end
