class ArticlesController < ApplicationController

  before_action :set_article, only:[:show, :edit, :update]

  def index
    @articles = Article.all
  end

  def show
    @article_comment = ArticleComment.new
    @article_comments = @article.article_comments
  end

  def new
    @article = Article.new
  end

  def create
    article = Article.new(article_params)
    if article.save
      post_notification(article)
      redirect_to articles_path
    else
      render :new
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
  
  def search
    @articles = Article.where("title LIKE(?)", "#{params[:search]}%")
  end

  private

  def article_params
    params.require(:article).permit(:title, :content, tag_ids: [])
  end

  def set_article
    @article = Article.find(params[:id])
  end
  
  def post_notification(article)
    notification = Slack::Notifier.new "https://hooks.slack.com/services/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"
      message = {
                  "fallback": "Tech::Shareに新しい記事が投稿されました。",
                  "color": "#8888",
                  "pretext": "<!here> Tech::Shareに新しい記事が投稿されました。",
                  "author_name": "user_name",
                  "author_link": "user_mypage_url",
                  "author_icon": "https://icon-pit.com/wp-content/uploads/2018/10/person_icon_364-300x300.png",
                  "title": "#{article.title}\nhttp://localhost:3000/articles/#{article.id}",
                  "title_link": "http://localhost:3000/articles/#{article.id}",
                  "text": "#{article.content}",
                  "image_url": "https://i0.wp.com/pg-work.com/wp-content/uploads/2019/08/TECHEXPERT-e1533109650694.png?resize=727%2C222&ssl=1"
        }
      notification.post attachments: [message]
  end

end
