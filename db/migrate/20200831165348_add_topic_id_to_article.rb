class AddTopicIdToArticle < ActiveRecord::Migration[6.0]
  def change
    add_reference :articles, :topic, foreign_key: true
  end
end
