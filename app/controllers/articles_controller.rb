class ArticlesController < ApplicationController
  before_action :set_article, only:[:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only:[:index, :show, :search]

  def index
    @articles = Article.all
  end

  def show
    @article_comment = ArticleComment.new
    @article_comments = @article.article_comments
    @favorite = current_user.favorites.find_by(article_id: @article.id)
  end

  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.new(article_params)
    if @article.save
      begin
        post_notification(@article)
      rescue => exception
        redirect_to root_path
      else
        redirect_to articles_path
      end
    else
      render :new
    end
  end

  def destroy
    if @article.destroy
      redirect_to root_path
    else
      redirect_to @article
    end
  end
  
  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def information
  end

  private

  def article_params
    params.require(:article).permit(:title, :content, tag_ids: [])
  end

  def set_article
    @article = Article.find(params[:id])
  end

  def post_notification(article)
    require 'slack-ruby-client'

    Slack.configure do |config|
      # APIトークンを設定
      config.token = Rails.application.credentials[:slack_token]
      config.token = 'xoxb-81666833746-1063177306068-5N57GhdI1F5wRF9UxC9VuenL'
    end

    # APIクライアントを生成
    client = Slack::Web::Client.new

    # チャンネル名 of @ユーザー名
    channel = '#slack_api_test_channel'

    # メッセージ
      client.chat_postMessage(channel: '#slack_api_test_channel',
                                 blocks: [{"type": "section", "text": {"type": "mrkdwn", "text": "@here *◎TECH::SHAREに新しい記事が投稿されました* ```#{article.title}(#{article.user.nickname})``` http://localhost:3000/articles/#{article.id}"}}],
                                 as_user: true)  
  end
end
