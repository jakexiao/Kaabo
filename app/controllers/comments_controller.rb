class CommentsController < ApplicationController
  def new
    @theme = Theme.find(params:[:theme_id])
    @comment = Comment.new
  end 

  def create
    @comment = Comment.new(comment_params)
    @theme = Theme.find(params[:theme_id])
    @comment.theme = @theme
    @comment.user = current_user
    if @comment.save
        redirect_to theme_path(@theme), notice: "comment created"
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

    redirect_to theme_path(@theme)
  end 

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to theme_path(@comment.theme)
  end

  private

    def comment_params
      params.require(:comment).permit(:content, :date, files: [])
    end
end
