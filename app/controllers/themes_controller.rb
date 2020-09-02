class ThemesController < ApplicationController
  def new
      @topic = Topic.find(params[:topic_id])
      @user = User.find(params[:user_id])
      @theme = Theme.new
  end

  def create
    @theme = Theme.new(theme_params)
    @topic = Topic.find(params[:topic_id])
    @user = User.find(params[:user_id])
    @theme.topic = @topic
    @theme.user = @user
    @theme.save
  end

  def index
    @topic = Topic.find(params[:topic_id])
    @themes = @topic.themes
  end

  def show
    @theme = Theme.find(params[:id])
    @comments = @theme.comments
  end

  def destroy
    @theme = Theme.find(params[:id])
    @theme.destroy
  end

  def update
    @theme = Theme.find(params[:id])
    @theme.update(theme_params)
  end

  private

  def theme_params
    params.require(:theme).permit(:title, :date)
  end
  
end
