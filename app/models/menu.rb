class Menu < ApplicationRecord
  belongs_to :salon_user, optional: true
end
