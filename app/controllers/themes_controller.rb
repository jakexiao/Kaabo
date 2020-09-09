class ThemesController < ApplicationController
  before_action :authenticate_user!, only: [:new] 

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
    @bookmark = Bookmark.new
    @topic = Topic.find(params[:topic_id])
    @themes = @topic.themes
    if params[:reset]
      session[:filter] = nil
      session[:period] = nil
    end
    session[:filter] = params[:filter] if params[:filter]
    session[:period] = params[:period] if params[:period]
    if params[:query]
      @themes = Theme.where("title ILIKE '%#{params[:query]}%'")
    else
      # in order to make the "Most liked" and "Most comment" work independently, we need line 35
      filter
      if session[:period] == "today"
        @themes = @themes.where("themes.date >= ?", DateTime.now)
        filter
      elsif params[:period] == "week"
        @themes = @themes.where("themes.date >= ?", DateTime.now - 7.days)
        filter
      elsif params[:period] == "month"
        @themes = @topic.themes.where("themes.date >= ?", DateTime.now - 1.month)
        filter
      elsif params[:period] == "year"
        @themes = @topic.themes.where("themes.date >= ?", DateTime.now - 1.year)
        filter
      elsif params[:period] == "all"
        @themes = @topic.themes.where("themes.date >= ?", DateTime.now - 10.year)
        filter
      else
        @themes = @themes.order(date: :desc)
      end
    end
    @themes = @themes.page(params[:page]).per(10)
  end

  def show
    @theme = Theme.find(params[:id])
    @comments = @theme.comments
    if params[:reset]
      session[:filter] = nil
      session[:period] = nil
    end
    session[:filter] = params[:filter] if params[:filter]
    session[:period] = params[:period] if params[:period]
    if params[:query]
      @comments = Comment.where("content ILIKE '%#{params[:query]}%'")
    else
      filter_comments
      if session[:period] == "today"
        @comments = @comments.where("comments.date >= ?", DateTime.now)
        filter_comments
      elsif params[:period] == "week"
        @comments = @comments.where("comments.date >= ?", DateTime.now - 7.days)
        filter_comments
      elsif params[:period] == "month"
        @comments = @comments.where("comments.date >= ?", DateTime.now - 1.month)
        filter_comments
      elsif params[:period] == "year"
        @comments = @comments.where("comments.date >= ?", DateTime.now - 1.year)
        filter_comments
      elsif params[:period] == "all"
        @comments = @comments.where("comments.date >= ?", DateTime.now - 10.year)
        filter_comments
      else
        @comments = @comments.order(date: :desc)
      end
    end
    @comments = @comments.page(params[:page]).per(10)
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

  def filter
    if session[:filter] == "likes"
      @themes = @themes.left_joins(:themeupvotes)
      .group(:id)
      .order('COUNT(themeupvotes.id) DESC')
    elsif session[:filter] == "comments"
      @themes = @themes.left_joins(:comments)
      .group(:id)
      .order('COUNT(comments.id) DESC')
    end
  end

  def filter_comments
    if session[:filter] == "likes"
      @comments = @comments.left_joins(:commentupvotes)
      .group(:id)
      .order('COUNT(commentupvotes.id) DESC')
    end
  end

end
