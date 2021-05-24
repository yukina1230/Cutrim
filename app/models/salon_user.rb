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

  def self.guest
    find_or_create_by!(email: 'salonguest@example.com') do |salon_user|
      salon_user.password = SecureRandom.urlsafe_base64
      salon_user.salon_name = "サロンゲスト"
      salon_user.phone = "01200000000"
      salon_user.postal_code = "153-0044"
      salon_user.prefecture_code = "東京都"
      salon_user.address_city = "目黒区大橋１丁目3-2"
    end
  end

end
