class Post < ApplicationRecord
  belongs_to :salon_user
  has_many :post_images, dependent: :destroy
  accepts_attachments_for :post_images, attachment: :image
  has_many :favorites, dependent: :destroy

  with_options presence: true do
    validates :dog_breed
    validates :caption
  end

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def self.search(search)
    if search
      Post.where(['dog_breed LIKE ?', "%#{search}%"])
    else
      Post.all
    end
  end

end
