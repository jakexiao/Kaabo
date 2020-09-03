class PagesController < ApplicationController

  def home
    @topics = Topic.all
  end
end
