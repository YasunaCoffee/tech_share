class FavoritesController < ApplicationController
  before_action :set_article, only: [:create, :destroy]
  protect_from_forgery except: :create

  def index
    @favorites = current_user.favorite_articles
  end

  def create
    @favorite = current_user.favorites.new(article: @article)  
    @favorite.save
    # TODO
    # エラーハンドリング
  end

  def destroy
    @favorite = Favorite.find_by(params[:favorite_id])
    @favorite.destroy
    # TODO
    # エラーハンドリング
  end

  private
  def set_article
    @article = Article.find(params[:article_id])
  end
end
