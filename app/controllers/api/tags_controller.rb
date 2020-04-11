class Api::TagsController < ApplicationController

  def search
    @tags = Tag.where('name LIKE(?)', "#{params[:keyword]}%").where.not(id: params[:tag_ids])
    render json: @tags
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      render json: @tag
    else
      render json: @tag
    end
  end

  private
  def tag_params
    params.permit(:name)
  end
end
