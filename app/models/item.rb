class Item < ApplicationRecord
  # has_one :purchase
  belongs_to :user
  has_one_attached :image

  validates :item_name, presence: true, length: { maximum: 40 }
  validates :explanation, presence: true, length: { maximum: 1000 }
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank" }
  validates :state_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_fee_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_day_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range"}
  validates :price, numericality: { with: /\A[0-9]+\z/, message: "is invalid. Input half-width number."}  
  validates :image, presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :shipping_day
  belongs_to :shipping_fee
  belongs_to :shipping_prefecture
  belongs_to :state

  
end
