class CommentsController < ApplicationController
  def new
    @theme = Theme.find(params[:theme_id])
    @comment = Comment.new
  end 

  def create
    @comment = Comment.new(comment_params)
    @theme = Theme.find(params[:theme_id])
    @comment.theme = @theme
    @comment.theme.user = current_user
    if @comment.save
        redirect_to topic_theme_path(@comment.theme.topic, @comment.theme), notice: "comment created"
    else 
      render :new
    end
  end
  
  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)

    redirect_to topic_theme_path(@comment.theme.topic, @comment.theme)
  end 

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to theme_path(@comment.theme)
  end

  def dashboard
    @my_themes = current_user.themes
    @my_comments = current_user.comments
    @current_user = current_user
  end

  private

    def comment_params
      params.require(:comment).permit(:content, :date, files: [])
    end
end
