class SearchController < ApplicationController
  def index
    
    if params[:search_type] = 'ナレッジを検索'
      @articles = Article.search(params[:search])
    elsif params[:search_type] = '質問を検索'
      @question = Question.search(params[:search])
      # render先を指定
    elsif params[:search_type] = 'ナレッジと質問を検索'
      @articles = Article.search(params[:search])
      @question = Question.search(params[:search])
    #render先を指定
    else
      redirect_to root_path
    end

  end
end
