class Comment < ApplicationRecord
  belongs_to :theme
  belongs_to :user
  has_many :commentupvotes, dependent: :destroy

  has_many_attached :files

  def get_commentupvote_of_user(user)
    self.commentupvotes.where(user: user).first
  end 
end
