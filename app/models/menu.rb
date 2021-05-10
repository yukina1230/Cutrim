class Menu < ApplicationRecord
  belongs_to :salon_user, optional: true

  with_options presence: true do
    validates :name
    validates :caption
    validates :amount
  end

end
