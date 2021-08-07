# README

#テーブル設計

##users（ユーザー情報）テーブル

| Column              | Type    | Options      |
|---------------------|---------|--------------|
| nickname            | string  | null:false   |
| email               | string  | null:false   |
| password            | string  | null:false   |
| family_name         | string  | null:false   |
| first_name          | string  | null:false   |
| family_name_reading | string  | null:false   |
| first_name_reading  | string  | null:false   |
| birth_year          | integer  | null:false   |
| birth_month         | integer  | null:false   |
| birth_day           | integer  | null:false   |

### Association

- has_many :items
- has_many :purchases

##items (商品情報)テーブル

| Column              | Type       | Options                      |
|---------------------|------------|----------------------------- |
| image               | text       | null:false                   |
| item_name           | string     | null:false                   |
| explanation         | text       | null:false                   |
| category            | string     | null:false                   |
| state               | string     | null:false                   |
| shipping_fee        | string     | null:false                   |
| shipping_prefecture | integer    | null:false                   |
| shipping_day        | string     | null:false                   |
| price               | integer    | null:false                   |
| user_id             | references | null:false,foreign_key: true |

### Association

- has_one :purchase

##purchases (購入記録)テーブル

| Column              | Type       | Options                      |
|---------------------|------------|----------------------------- |
| user_id             | references | null:false,foreign_key: true |
| item_id             | references | null:false,foreign_key: true |

### Association

- belongs_to :item
- has_one :address

##addresses (発送情報)

| Column              | Type       | Options                      |
|---------------------|------------|----------------------------- |
| postal_code         | string     | null:false                   |
| prefecture          | integer    | null:false                   |
| city                | string     | null:false                   |  
| house_number        | string     | null:false                   |
| phone_number        | string     | null:false                   |
| purchase_id         | references | null:false,foreign_key: true |

### Association

- belongs_to :purchase
