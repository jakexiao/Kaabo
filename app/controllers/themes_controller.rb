class ThemesController < ApplicationController
  def new
      @topic = Topic.find(params[:topic_id])
      # @user = User.find(params[:user_id])
      @theme = Theme.new
  end

  def create
    @theme = Theme.new(theme_params)
    @topic = Topic.find(params[:topic_id])
    # @user = User.find(params[:user_id])
    @theme.topic = @topic
    @theme.user_id = current_user.id
    if @theme.save
      redirect_to topic_themes_path(@topic)
    else 
      render :new
    end 
  end

  def index
    if params[:query]
      @topic = Topic.find(params[:topic_id])
      @themes = Theme.where("title ILIKE '%#{params[:query]}%'")
    else
    @topic = Topic.find(params[:topic_id])
    @themes = @topic.themes.sort
    @bookmark = Bookmark.new
    end
    @themes = Theme.page(params[:page]).per(10)
  end

  def show
    if params[:query].present?
      @theme = Theme.find(params[:id])
      @comments = Comment.where("content ILIKE '%#{params[:query]}%'")
    else
      @theme = Theme.find(params[:id])
      @comments = @theme.comments
    end
  end

  def destroy
    @theme = Theme.find(params[:id])
    @theme.destroy
    redirect_to dashboard_path
  end

  def edit
    @theme = Theme.find(params[:id])
  end

  def update
    @theme = Theme.find(params[:id])
    @theme.update(theme_params)

    redirect_to dashboard_path
  end

  private

  def theme_params
    params.require(:theme).permit(:title, :date)
  end
  
end
