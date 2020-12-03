FactoryBot.define do
  factory :purchase do
    association :buyer
    association :item
    postal_code   { "#{rand(100..999)}-#{rand(1000..9999)}" }
    source_id     { rand(1..47) }
    city          { Gimei.address.city.kanji }
    house_number  { Gimei.address.town.kanji }
    building_name { Faker::Address.street_address }
    phone_number  { rand(10_000_000_000..99_999_999_999) }
  end
end
