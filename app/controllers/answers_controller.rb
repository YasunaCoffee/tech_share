class AnswersController < ApplicationController
  def create
    answer = current_user.answers.new(answer_params)
    if answer.save
      redirect_to question_path(answer.question_id)  
    else
      render template: "questions/show"
    end
  end

  private
  def answer_params
    params.require(:answer).permit(:content).merge(question_id: params[:question_id])
  end
end
