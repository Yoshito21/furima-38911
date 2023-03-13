FactoryBot.define do
  factory :purchase_order do
    token         { Faker::Internet.password }
    post_code     { Faker::Number.decimal_part(digits: 3) + '-' + Faker::Number.decimal_part(digits: 4) }
    municipality  { Faker::Address.city }
    address       { Faker::Address.street_address }
    building_name { Faker::Address.building_number }
    phone_number  { Faker::Number.decimal_part(digits: 11) }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
  end
end
