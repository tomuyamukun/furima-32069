class Item < ApplicationRecord
  belongs_to :user
  # has_one :order
  has_one_attached :image 
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category  
  validates :category_id, numericality: { other_than: 1, message: "Select" } 

  belongs_to :status
  validates :status_id, numericality: { other_than: 1, message: "Select" } 

  belongs_to :fee
  validates :fee_id, numericality: { other_than: 1, message: "Select" }
  
  belongs_to :source
  validates :source_id, numericality: { other_than: 1, message: "Select" } 

  belongs_to :shipping
  validates :shipping_id, numericality: { other_than: 1, message: "Select" } 

  validates :price, numericality: { message: "Half-width number" }

  with_options presence: true do
    validates :name, length: { maximum: 40 }
    validates :text, length: { maximum: 1000 }
    validates :category_id
    validates :status_id
    validates :fee_id
    validates :source_id
    validates :shipping_id
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999,
       message: "Out of setting range" }
    validates :user
    validates :image
  end

end
