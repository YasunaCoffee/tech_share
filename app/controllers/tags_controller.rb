class TagsController < ApplicationController

  def new
    @tags = Tag.all
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      redirect_to new_article_path
    else
      render :new
    end
  end

  private
    def tag_params
      params.require(:tag).permit(:name)
    end
end
