class FavoritesController < ApplicationController
  before_action :set_article, only: :create
  protect_from_forgery except: :create

  def index
    @favorites = current_user.favorite_articles
  end

  def create
    @favorite = current_user.favorites.new(article: @article)
   
    if @favorite.save
      respond_to do |format|
        format.html {redirect_to @article}
        format.json
      end
    else
      render template: "articles/show"
    end
  end

  def destroy
    @favorite = Favorite.find_by(params[:favorite_id])
    @favorite.destroy
  end

  private
  def set_article
    @article = Article.find(params[:article_id])
  end
end
