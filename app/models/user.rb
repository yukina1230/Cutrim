class User < ApplicationRecord
  include JpPrefecture
  jp_prefecture :prefecture_code
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :favorites, dependent: :destroy
  has_many :reservations, dependent: :destroy

  with_options presence: true do
    validates :family_name
    validates :first_name
    validates :family_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :nickname
    validates :postal_code, format: {with: /\A\d{3}[-]\d{4}\z/ }
    validates :prefecture_code
    validates :address_city
    validates :phone, format: {with: /\A\d{10,11}\z/ }
    validates :email, uniqueness: true
  end

  def prefecture_name
    JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
  end

  def prefecture_name=(prefecture_name)
    self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
  end

end
