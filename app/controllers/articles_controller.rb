class ArticlesController < ApplicationController
  before_action :set_article, only:[:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only:[:index]

  def index
    @articles = Article.order(updated_at: :desc)
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
    params[:signed_ids].each do |signed_id|
      @article.images.attach(signed_id)
    end
    if @article.save
      redirect_to @article and return unless Rails.env.production?
      begin
        post_notification(@article)
      rescue => exception
        redirect_to new_article_path
      else
        redirect_to @article
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
    notification = Slack::Notifier.new Rails.application.credentials.slack[:web_hook]
      message = {
                  "fallback": "Tech::Shareに新しい記事が投稿されました。",
                  "color": "#8888",
                  "pretext": "<!here> Tech::Shareに新しい記事が投稿されました。",
                  "author_name": article.user.nickname,
                  "author_link": user_path(article.user),
                  "author_icon": "https://icon-pit.com/wp-content/uploads/2018/10/person_icon_364-300x300.png",
                  "title": "#{article.title}\n#{root_url}articles/#{article.id}",
                  "title_link": "#{root_url}articles/#{article.id}",
                  "text": "#{article.content}",
                  "image_url": "https://i0.wp.com/pg-work.com/wp-content/uploads/2019/08/TECHEXPERT-e1533109650694.png?resize=727%2C222&ssl=1"
                }
      notification.post attachments: [message]
  end

end
