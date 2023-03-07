FactoryBot.define do
  factory :item do
    item_name        { Faker::Lorem.word }
    item_explanation { Faker::Lorem.paragraph }
    category_id      { Faker::Number.between(from: 2, to: 11) }
    condition_id     { Faker::Number.between(from: 2, to: 7) }
    shipping_cost_id { Faker::Number.between(from: 2, to: 3) }
    prefecture_id    { Faker::Number.between(from: 2, to: 48) }
    day_to_ship_id   { Faker::Number.between(from: 2, to: 4) }
    item_price       { Faker::Number.between(from: 2, to: 9_999_999) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
