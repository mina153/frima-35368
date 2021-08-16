FactoryBot.define do
  factory :purchase_address do
    token {"tok_abcdefghijk00000000000000000"}
    postal_code { '123-4567' }
    shipping_prefecture_id { 2 }
    city { '札幌市' }
    house_number { '1-1' }
    building_number { '' }
    phone_number { 12345678901 }
  end
end
