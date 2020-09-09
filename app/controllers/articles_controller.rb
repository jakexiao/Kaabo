class ArticlesController < ApplicationController
  before_action :check_user_is_admin, only: [:new, :create, :edit, :update, :destroy]

  def index
    if params[:query]
      sql_query = "title ILIKE :query OR content ILIKE :query"
      @articles = Article.where(sql_query, query: "%#{params[:query]}%")
    else
      @topic = Topic.find(params[:topic_id])
      @articles = Article.all.order(date: :desc)
    end
    @articles = @articles.page(params[:page]).per(10)
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
    # @user = User.find(params[:user_id])
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @topic = Topic.find(params[:topic_id])
    # @user = User.find(params[:user_id])
    @article.topic = @topic
    @article.user_id = current_user.id
    if @article.save
      redirect_to topic_articles_path(@topic)
    else 
      render :new
    end 
  end

  def edit
    @topic = Topic.find(params[:topic_id])
    @article = Article.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:topic_id])
    @article = Article.find(params[:id])
    @article.user_id = current_user.id
    if @article.update!(article_params)
      redirect_to topic_article_path(@article)
    else
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to topic_articles_path
  end



  private

  def article_params
    params.require(:article).permit(:title, :content, :date, :image_url)
  end

  def check_user_is_admin
    unless current_user.admin
      redirect_to topic_articles_path
      # flash.now[:alert] = "You don't have the access to take this action!"
      # format.html { redirect_to request.referer, alert: "You don't have the access to take this action!" }
    end 
  end
end
