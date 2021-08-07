# README

#テーブル設計

##users（ユーザー情報）テーブル

| Column              | Type    | Options                      |
|---------------------|---------|------------------------------|
| nickname            | string  | null:false                   |
| email               | string  | null:false, uniqueness: true |
| encrypted_password  | string  | null:false                   |
| family_name         | string  | null:false                   |
| first_name          | string  | null:false                   |
| family_name_reading | string  | null:false                   |
| first_name_reading  | string  | null:false                   |
| birth_day           | date    | null:false                   |

### Association

- has_many :items
- has_many :purchases

##items (商品情報)テーブル

| Column                 | Type       | Options                      |
|------------------------|------------|----------------------------- |
| item_name              | string     | null:false                   |
| explanation            | text       | null:false                   |
| category_id            | integer    | null:false                   |
| state_id               | integer    | null:false                   |
| shipping_fee_id        | integer    | null:false                   |
| shipping_prefecture_id | integer    | null:false                   |
| shipping_day_id        | integer    | null:false                   |
| price                  | integer    | null:false                   |
| user                   | references | null:false,foreign_key: true |

### Association

- has_one :purchase
- belongs_to :user

##purchases (購入記録)テーブル

| Column              | Type       | Options                      |
|---------------------|------------|----------------------------- |
| user                | references | null:false,foreign_key: true |
| item                | references | null:false,foreign_key: true |

### Association

- belongs_to :item
- has_one :address
- belongs_to :user

##addresses (発送情報)

| Column                 | Type       | Options                      |
|------------------------|------------|----------------------------- |
| postal_code            | string     | null:false                   |
| shipping_prefecture_id | integer    | null:false                   |
| city                   | string     | null:false                   |  
| house_number           | string     | null:false                   |
| building_number        | string     |                              |
| phone_number           | string     | null:false                   |
| purchase               | references | null:false,foreign_key: true |

### Association

- belongs_to :purchase
