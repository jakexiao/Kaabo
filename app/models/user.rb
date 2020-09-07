class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :themes, dependent: :destroy
  has_many :comments
  has_many :themeupvotes
  has_many :commentupvotes
  has_many :bookmarks, through: :themes, dependent: :destroy

  has_one_attached :photo

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
