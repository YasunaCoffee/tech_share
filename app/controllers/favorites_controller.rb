class FavoritesController < ApplicationController
  before_action :set_article

  def create
    @favorite = current_user.favorites.new(article: @article)
    if @favorite.save
      redirect_to article_path(@article)
    else
      redirect_to article_path(@article)
    end
  end

  # TODO：
  # JSでお気に入りボタン押されたら非同期でここに飛ばす

  private
  def set_article
    @article = Article.find(params[:article_id])
  end
end
