class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :shipping_prefecture_id, :city, :house_number, :building_number, :phone_number, :token

  with_options presence: true do
    validates :token
    validates :postal_code, format: {with: /\A\d{3}[-]\d{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)"}
    validates :shipping_prefecture_id, numericality: {other_than: 1, message: "can't be blank"}
    validates :city
    validates :house_number
    validates :phone_number
    validates :user_id
    validates :item_id
  end

    validates :phone_number, numericality: {only_integer: true, message:  "is invalid. Input only number" }
    validates :phone_number, length: { minimum: 10, message: "is too short"}

    
  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, shipping_prefecture_id: shipping_prefecture_id, city: city, house_number: house_number, building_number: building_number, phone_number: phone_number, purchase_id: purchase.id)
  end
end