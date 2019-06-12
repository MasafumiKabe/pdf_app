class Receipt < ApplicationRecord
  with_options presence: true do
    validates :date
    validates :name
    validates :price
    validates :provision
  end
end
