class Purchase
  include ActiveModel::Model
  attr_accessor :postal_code, :source_id, :city, :house_number, :building_name, :phone_number, :user_id, :item_id, :token

  
  # ここにバリデーションの処理を書く
  # extend ActiveHash::Associations::ActiveRecordExtensions
  # belongs_to :source


  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'Input correctly'}
    validates :source_id, numericality: { other_than: 1, message: 'Select' }
    validates :city
    validates :house_number
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'Input only number'}
    validates :user_id
    validates :item_id
    validates :token
  end



  def save
    buyer = Buyer.create(user_id: user_id, item_id: item_id)
    Order.create(buyer_id: buyer.id, postal_code: postal_code, source_id: source_id, city: city, house_number: house_number, phone_number: phone_number, token: token)
  end
end