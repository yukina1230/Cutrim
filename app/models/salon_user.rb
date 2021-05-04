class SalonUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :salon_image
  has_many :menus, dependent: :destroy
  has_many :posts, dependent: :destroy
end
