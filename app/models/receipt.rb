class Receipt < ApplicationRecord
  with_options presence: true do
    validates :date
    validates :name
    validates :publisher
    validates :representative
    validates :price
    validates :provision
  end
end
