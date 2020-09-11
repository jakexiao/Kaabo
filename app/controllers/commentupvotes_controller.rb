class CommentupvotesController < ApplicationController
    def create
        @comment = Comment.find(params[:comment_id])
        @commentupvote = Commentupvote.create(comment: @comment, user:current_user)
        # redirect_to topic_theme_path(@comment.theme.topic, @comment.theme)
      end
      
      def destroy
        @commentupvote = Commentupvote.find(params[:id])
        @comment = @commentupvote.comment
        @commentupvote.destroy
        # redirect_to topic_theme_path(@commentupvote.comment.theme.topic, @commentupvote.comment.theme)
      end
end
