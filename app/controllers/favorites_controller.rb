class FavoritesController < ApplicationController
  before_action :set_article

  def create
    @favorite = current_user.favorites.new(article: @article)
  end

  private
  def set_article
    @article = Article.find(params[:article_id])
  end
end
