class Topic < ApplicationRecord
  has_many :articles
  has_many :themes
end
