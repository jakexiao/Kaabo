class Theme < ApplicationRecord
  belongs_to :topic
  belongs_to :user
  has_many :themeupvotes
  has_many :comments
end
