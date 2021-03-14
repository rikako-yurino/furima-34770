FactoryBot.define do
  factory :order_delivery do
    token              {Faker::Lorem.sentence}
    postcode           {"123-4567"}
    prefecture_id      {Faker::Number.between(from: 2, to: 48)}
    city               {Faker::Lorem.sentence}
    block              {Faker::Lorem.sentence}
    building           {Faker::Lorem.sentence}
    phone_number       {99999999999}
  end
end
