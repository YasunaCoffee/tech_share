class AnswerCommentsController < ApplicationController
  def create
    @answer_comment = current_user.answer_comments.new(comment_params)
    if @answer_comment.save
      redirect_to question_path(params[:question_id])  
    else
      @question = Question.find(params[:question_id])
      @answer = Answer.new
      @answers = @question.answers
      render template: "questions/show"
    end
  end

  def destroy
    answer_comment = AnswerComment.find(params[:id])
    answer_comment.destroy
    redirect_to answer_comment.answer.question
  end

  private
  def comment_params
    params.require(:answer_comment).permit(:content).merge(answer_id: params[:answer_id])
  end
end

