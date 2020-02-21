class ArticleCommentsController < ApplicationController
    def create
      comment = ArticleComment.new(comment_params)
      if comment.save
        redirect_to article_path(comment.article_id)  
      else
        render template: "articles/show"
      end
    end
  
    private
    def comment_params
      params.require(:article_comment).permit(:content).merge(article_id: params[:article_id], user_id: current_user.id)
    end
  end