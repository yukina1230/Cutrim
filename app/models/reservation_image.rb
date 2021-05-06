class ReservationImage < ApplicationRecord
  belongs_to :reservation
  attachment :image
end
