class BookmarksController < ApplicationController
  def index
    @bookmarks = Bookmark.where(user: current_user).order(created_at: :desc)
  end

  def create
    @theme = Theme.find(params[:theme_id])
    @bookmark = Bookmark.create(theme: @theme, user:current_user)
    redirect_to topic_themes_path(@theme.topic)
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    if request.referer.include? "dashboard"
      redirect_to dashboard_path
    else
      redirect_to topic_themes_path(@bookmark.theme.topic)
    end 
  end
end
