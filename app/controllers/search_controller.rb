class SearchController < ApplicationController
  def index
    @articles = Article.search(params[:search])
    @questions = Question.search(params[:search])
    render :index, format: :json
  end

  def users_index
    @users  = User.where(["nickname LIKE(?)", "%#{params[:search]}%"])
  end
end
