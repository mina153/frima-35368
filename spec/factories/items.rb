FactoryBot.define do
  factory :item do
    image {Faker::Lorem.sentence}
    item_name {Faker::Lorem.sentence}
    explanation {Faker::Lorem.sentence}
    category_id {2}
    state_id {2}
    shipping_fee_id {2}
    shipping_prefecture_id {2}
    shipping_day_id {2}
    price {5000}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end 

  end
end



