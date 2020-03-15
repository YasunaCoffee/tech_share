class FavoritesController < ApplicationController
  before_action :set_article, only: :create
  protect_from_forgery except: :create

  def index
    @favorites = current_user.favorite_articles
  end

  def create
    binding.pry
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

  private
  def set_article
    @article = Article.find(params[:article_id])
  end
end
