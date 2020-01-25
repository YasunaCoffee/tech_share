class TagsController < ApplicationController

  def new
    @tags = Tag.all
    @tag = Tag.new
  end

  def create
    @tag = Tag.create(tag_params)
    redirect_to new_article_path
  end

  private
    def tag_params
      params.require(:tag).permit(:name)
    end
end
