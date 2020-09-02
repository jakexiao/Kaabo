class Theme < ApplicationRecord
  belongs_to :topic
  belongs_to :user
  has_many :themeupvotes, dependent: :destroy
  has_many :comments, dependent: :destroy

  def get_themeupvote_of_user(user)
    self.themeupvotes.where(user: user).first
  end 
end
