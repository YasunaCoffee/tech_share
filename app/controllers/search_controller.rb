class SearchController < ApplicationController
  def index
    @articles = Article.search(params[:search], params[:tag_ids])
    @questions = Question.search(params[:search], params[:tag_ids])
    render :index, format: :json
  end

  def users_index
    @users  = User.where(["nickname LIKE(?)", "%#{params[:search]}%"])
  end
end
