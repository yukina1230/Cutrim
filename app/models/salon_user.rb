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
    validates :prefecture_code
    validates :address_city
    validates :phone, format: {with: /\A\d{10,11}\z/ }
    validates :email, uniqueness: true
  end

  def self.search(search)
    if search
      SalonUser.where(['prefecture_code LIKE ?', "#{search}"])
    else
      SalonUser.all
    end
  end

  geocoded_by :address
  after_validation :geocode, if: :prefecture_code_changed?
  after_validation :geocode, if: :address_city_changed?
  after_validation :geocode, if: :address_building_changed?

  def address
    [self.prefecture_code,self.address_city,self.address_building].compact.join()
  end

end
