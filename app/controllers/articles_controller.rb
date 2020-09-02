class ArticlesController < ApplicationController
  def index
    @topic = Topic.find(params[:topic_id])
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end
end
