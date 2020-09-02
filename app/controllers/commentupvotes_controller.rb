class CommentupvotesController < ApplicationController
    def create
        @comment = Comment.find(params[:comment])
        @commentupvote = Commentupvote.create(comment: @comment, user:current_user)
        redirect_to topic_theme_path(@comment.theme.topic, @comment.theme)
      end
      
      def destroy
        @commentupvote = Commentupvote.find(params[:id])
        @commentupvote.destroy
        redirect_to topic_theme_path(@comment.theme.topic, @comment.theme)
      end
end
