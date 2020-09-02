class ThemeupvotesController < ApplicationController
    def create
      @theme = Theme.find(params[:theme])
      @themeupvote = Themeupvote.create(theme: @theme, user:current_user)
      redirect_to topic_themes_path(@theme.topic, @theme)
    end
    
    def destroy
      @themeupvote = Themeupvote.find(params[:id])
      @themeupvote.destroy
      redirect_to topic_themes_path(@theme.topic, @theme)
    end
end
