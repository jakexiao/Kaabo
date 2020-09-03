class Theme < ApplicationRecord
  belongs_to :topic
  belongs_to :user
  has_many :themeupvotes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy

  def get_themeupvote_of_user(user)
    self.themeupvotes.where(user: user).first
  end 

  def get_bookmark_of_user(user)
    self.bookmarks.where(user: user).first
  end
end
