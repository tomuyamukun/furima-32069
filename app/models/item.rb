class Item < ApplicationRecord
  belongs_to :user
  has_one :buyer
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :fee
  belongs_to :source
  belongs_to :shipping

  with_options numericality: { other_than: 1, message: 'Select' } do
    validates :category_id
    validates :status_id
    validates :fee_id
    validates :source_id
    validates :shipping_id
  end

  validates :price, numericality: { message: 'Half-width number' }

  with_options presence: true do
    validates :name, length: { maximum: 40 }
    validates :text, length: { maximum: 1000 }
    validates :category_id
    validates :status_id
    validates :fee_id
    validates :source_id
    validates :shipping_id
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999,
                                      message: 'Out of setting range' }
    validates :user
    validates :image
  end
end
