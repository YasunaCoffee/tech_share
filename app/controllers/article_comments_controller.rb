class ArticleCommentsController < ApplicationController
    def create
      comment = ArticleComment.create(comment_params)
      redirect_to "/articles/#{comment.article_id}" 
    end
  
    private
    def comment_params
      params.require(:article_comment).permit(:content).merge(article_id: params[:article_id])
    end
  end