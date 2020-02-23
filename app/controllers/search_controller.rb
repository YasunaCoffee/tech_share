class SearchController < ApplicationController
  def index
    
    if params[:search_type] == 'ナレッジを検索'
      @articles = Article.search(params[:search])
    elsif params[:search_type] == '質問を検索'
      @questions = Question.search(params[:search])
      # render先を指定
    elsif params[:search_type] == 'ナレッジと質問を検索'
      @articles = Article.search(params[:search])
      @questions = Question.search(params[:search])
    #render先を指定
    else
      redirect_to root_path
    end
    @tags = @articles.map do |article|
      article.tags.map do |tag|
        tag.name
      end
    end
binding.pry
    render :index, format: :json
  end

end
