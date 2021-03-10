FactoryBot.define do
  factory :item do
    product_name         {Faker::Lorem.sentence}
    description_product   {Faker::Lorem.sentence}
    price                 {Faker::Number.between(from: 300, to:9999999)}
    category_id           {Faker::Number.between(from: 2, to: 10)}
    item_status_id        {Faker::Number.between(from: 2, to:6)}
    delivery_burden_id    {Faker::Number.between(from: 2, to: 3)}
    delivery_area_id      {Faker::Number.between(from: 2, to: 48)}
    shipping_time_id      {Faker::Number.between(from: 2, to: 4)}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
