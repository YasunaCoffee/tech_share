class Api::TagsController < ApplicationController
  def search
    @tags = Tag.where('name LIKE(?)', "#{params[:keyword]}%").where.not(id: params[:tag_ids])
    render json: @tags
  end
end
