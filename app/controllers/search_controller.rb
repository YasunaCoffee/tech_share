class SearchController < ApplicationController
  def index
    @articles = Article.search(params[:search])
    @questions = Question.search(params[:search])
    render :index, format: :json
  end

end
