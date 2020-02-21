class QuestionsController < ApplicationController
  before_action :set_question, only:[:show, :edit, :update]
  skip_before_action :authenticate_user!, only:[:index, :show, :search]

  def index
    @questions = Question.all
  end
  
  def show
    @answer = Answer.new
    @answers = @question.answers
    @answer_comment = AnswerComment.new
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
  
  private

  def question_params
    params.require(:question).permit(:title, :content, tag_ids: []).merge(user_id: current_user.id)
  end

  def set_question
    @question = Question.find(params[:id])
  end
end
