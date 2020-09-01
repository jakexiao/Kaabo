class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :themes
  has_many :comments
  has_many :themeupvotes
  has_many :commentupvotes

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
