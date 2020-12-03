class Buyer < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :order
  with_options presence: true do
    validates :user
    validates :item
  end
end
