class Comment < ApplicationRecord
  belongs_to :theme
  has_many :commentupvotes
end
