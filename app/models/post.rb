class Post < ApplicationRecord
  belongs_to :salon_user
  has_many :post_images, dependent: :destroy
  accepts_attachments_for :post_images, attachment: :image
end
