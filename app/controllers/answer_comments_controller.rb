class AnswerCommentsController < ApplicationController
  def create
    comment = AnswerComment.new(comment_params)
    if comment.save
      redirect_to question_path(params[:question_id])  
    else
      render template: "questions/show"
    end
  end

  private
  def comment_params
    params.require(:answer_comment).permit(:content).merge(answer_id: params[:answer_id])
  end
end

