class QuestionsController < ApplicationController
  def index
    @question = Question.find(1)
  end

  def new
  end

  def create
  end

  def show
    @question = Question.find(1)
  end
end
