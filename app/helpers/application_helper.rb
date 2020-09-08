module ApplicationHelper
  def find_article_topic(article_id)
    Article.find(article_id).topic
  end

  def find_theme_topic(theme_id)
    Theme.find(theme_id).topic
  end
end
