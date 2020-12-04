class Order < ApplicationRecord
  # belongs_to :user
  # belongs_to :item
  belongs_to :buyer

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :source

end
