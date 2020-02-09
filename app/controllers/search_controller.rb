class SearchController < ApplicationController
  def index
    
    if params[:search_type] = 1
      @articles = Article.search(params[:search])
      #render 先を指定
    elsif params[:search_type] = 2
      @question = Question.search(params[:search])
      # render先を指定
    elsif params[:search_type] = 3
      @articles = Article.search(params[:search])
      @question = Question.search(params[:search])
    #render先を指定
    else
      redirect_to root_path
    end

  end
end
