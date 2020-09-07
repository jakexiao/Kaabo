class Article < ApplicationRecord
  belongs_to :topic
  include PgSearch::Model
  multisearchable against: [:title, :content]
end
