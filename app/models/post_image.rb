class PostImage < ApplicationRecord
  belongs_to :salon_user, optional: true
  attachment :post_image
end
