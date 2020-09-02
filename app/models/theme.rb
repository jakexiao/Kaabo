class Theme < ApplicationRecord
  belongs_to :topic
  belongs_to :user
  has_many :themeupvotes
  has_many :comments

  def get_themeupvote_of_user(user)
    self.themeupvotes.where(user: user).first
  end 
end
