class ArticleCommentsController < ApplicationController
    def create
      comment = current_user.article_comments.new(comment_params)
      if comment.save
        redirect_to article_path(comment.article_id)  
      else
        render template: "articles/show"
      end
    end

    def destroy
      article_comment = ArticleComment.find(params[:id])
      article_comment.destroy
      redirect_to article_comment.article
    end

    private
    def comment_params
      params.require(:article_comment).permit(:content).merge(article_id: params[:article_id])
    end
  end