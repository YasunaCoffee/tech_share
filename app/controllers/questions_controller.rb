class QuestionsController < ApplicationController
  before_action :set_question, only:[:show, :edit, :update]

  def index
    @questions = Question.all
  end
  
  def show
  end

  def new
    @question = Question.new
  end
  
  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to root_path
    else
      render :new
    end
  end
  
  def edit
  end

  def update
    if @question.update(question_params)
      redirect_to root_path
    else
      render :edit
    end
  end
  
  def search
    @questions = Question.where("title LIKE(?)", "#{params[:search]}%")
    @articles = Article.where("title LIKE(?)", "#{params[:search]}%")
  end
  private

  def question_params
    params.require(:question).permit(:title, :content, tag_ids: [])
  end

  def set_question
    @question = Question.find(params[:id])
  end
end
