class AnswerCommentsController < ApplicationController
  def create
    @answer_comment = AnswerComment.new(comment_params)
    if @answer_comment.save
      redirect_to question_path(params[:question_id])  
    else
      @question = Question.find(params[:question_id])
      @answer = Answer.new
      @answers = @question.answers
      render template: "questions/show"
    end
  end

  private
  def comment_params
    params.require(:answer_comment).permit(:content).merge(answer_id: params[:answer_id],user_id: current_user.id)
  end
end

