class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :salon_user
  has_many :reservation_images, dependent: :destroy
  accepts_attachments_for :reservation_images, attachment: :image

  enum dog_gender: { 'オス': 0, 'メス': 1 }

  with_options presence: true do
    validates :dog_name
    validates :dog_breed
    validates :dog_birth
    validates :dog_gender
    validates :menu
  end


  #今日から３ヶ月先までの予約データを取得
  def self.reservations_after_three_month
    reservations = Reservation.all.where("day >= ?", Date.current).where("day < ?", Date.current >> 3).order(day: :desc)
    reservation_data = []
    reservations.each do |reservation|
      reservations_hash = {}
      reservations_hash.merge!(day: reservation.day.strftime("%Y-%m-%d"), time: reservation.time)
      reservation_data.push(reservations_hash)
    end
    reservation_data
  end

  def self.check_reservation_day(day)
    if day < Date.current
      return "過去の日付は選択できません"
    elsif day < (Date.current + 1)
      return "当日は選択できません"
    elsif (Date.current >> 3) < day
      return "3ヶ月以降の日付は選択できません"
    end
  end

  def self.search(search)
    if search
      Reservation.where(['day LIKE ?', "#{search}"])
    else
      Reservation.all
    end
  end

end
