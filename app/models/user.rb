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

  def user_name
    [self.family_name,self.first_name].compact.join(" ")
  end

  def user_name_kana
    [self.family_name_kana,self.first_name_kana].compact.join(" ")
  end

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.family_name = "ゲスト"
      user.first_name = "ログイン"
      user.family_name_kana = "ゲスト"
      user.first_name_kana = "ログイン"
      user.nickname = "ゲスト"
      user.phone = "08000000000"
      user.postal_code = "153-0041"
      user.prefecture_code = "東京都"
      user.address_city = "目黒区駒場4-4"
    end
  end

end
