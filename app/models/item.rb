class Item < ApplicationRecord
  # has_one :purchase
  belongs_to :user
  has_one_attached :image

  validates :item_name, presence: true, length: { maximum: 40 }
  validates :explanation, presence: true, length: { maximum: 1000 }

  with_options presence: true do
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range"}
    validates :image
    

    with_options numericality: { other_than: 1 , message: "can't be blank"} do
      validates :category_id
      validates :state_id
      validates :shipping_fee_id
      validates :shipping_prefecture_id
      validates :shipping_day_id
    end
  end


  validates :price, numericality: { with: /\A[0-9]+\z/, message: "is invalid. Input half-width number."}  
 

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :shipping_day
  belongs_to :shipping_fee
  belongs_to :shipping_prefecture
  belongs_to :state

  
end
