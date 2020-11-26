
FactoryBot.define do
  factory :item do
    name {"higuma"}
    text {"新鮮なくまです"}
    category_id {3}
    status_id {3}
    fee_id {3}
    source_id {3}
    shipping_id {3}
    price {555}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/cutest-animal-1-fennec-fox.jpg'), filename: 'cutest-animal-1-fennec-fox.jpg')
    end
  end
end
