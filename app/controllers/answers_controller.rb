class AnswersController < ApplicationController
  def create
    answer = Answer.create(answer_params)
    redirect_to "/questions/#{answer.question_id}"   
  end

  private
  def answer_params
    params.require(:answer).permit(:content).merge(question_id: params[:question_id])
  end
end
