class ArticlesController < ApplicationController

  before_action :set_article, only:[:show]

  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    article = Article.new(article_params)
    if article.save!
      redirect_to articles_path
    else
      render :new
    end
  end

  def search
    @articles = Article.where("title LIKE(?)", "#{params[:search]}%")
  end

  private

  def article_params
    params.require(:article).permit(:title, :content, :tag)
  end

  def set_article
    @article = Article.find(params[:id])
  end

end
