class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :lists, dependent: :destroy

  validates :email, presence: true, uniqueness: true, format: { with: /\w+@\D+\.{1}[a-zA-Z]{2,}/ }
  validates :password, length: { minimum: 6 }
end
