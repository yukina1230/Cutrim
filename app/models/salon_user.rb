class SalonUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :salon_image
  has_many :menus, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :reservations, dependent: :destroy

  with_options presence: true do
    validates :salon_name
    validates :postal_code, format: {with: /\A\d{3}[-]\d{4}\z/ }
    validates :prefecture
    validates :address_city
    validates :phone, format: {with: /\A\d{10,11}\z/ }
    validates :email, uniqueness: true
  end
  
end
