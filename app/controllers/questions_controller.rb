class QuestionsController < ApplicationController
  before_action :set_question, only:[:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only:[:index, :show, :search]

  def index
    @questions = Question.all.order(updated_at: :desc)
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
    @question = current_user.questions.new(question_params)
    if @question.save
      redirect_to questions_path
    else
      render :new
    end
  end
  
  def destroy
    if @question.destroy
      redirect_to root_path
    else
      redirect_to @question
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
    params.require(:question).permit(:title, :content, tag_ids: [])
  end

  def set_question
    @question = Question.find(params[:id])
  end
end
