class ArticlesController < ApplicationController
  def index
    @topic = Topic.find(params[:topic_id])
    @articles = Article.all
    @articles = @articles.page(params[:page]).per(10)
  end

  def show
    @article = Article.find(params[:id])
  end
end
