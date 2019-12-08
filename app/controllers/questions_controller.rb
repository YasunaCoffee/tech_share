class QuestionsController < ApplicationController
  before_action :set_question, only:[:show]

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)

    if @question.save!
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  private

  def question_params
    params.require(:question).permit(:title, :content, :curriculum)
  end

  def set_question
    @question = Question.find(params[:id])
  end
end
