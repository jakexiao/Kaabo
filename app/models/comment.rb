class Comment < ApplicationRecord
  belongs_to :theme
  has_many :commentupvotes

  has_many_attached :files
end
