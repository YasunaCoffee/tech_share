class QuestionsController < ApplicationController
  def index
    @question = Question.find(1)
  end

  def show
    @question = Question.find(1)
  end
end
