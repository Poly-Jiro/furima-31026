# テーブル設計

## user_profiles

| Column             | Type       | Options                          |
| ------------------ | ---------- | -------------------------------- |
| family_name        | string     | null: false                      |
| family_name_kana   | string     | null: false                      |
| first_name         | string     | null: false                      |
| first_name_kana    | string     | null: false                      |
| birthday           | integer    | null: false                      |
| user               | references | null: false, foreign_key: true   |

### Association

- belongs_to :user
///- has_many :rooms, through: room_users
///- has_many :messages

## users テーブル

| Column             | Type       | Options                          |
| ------------------ | ---------- | -------------------------------- |
| nickname           | string     | null: false, unique: true        |
| email              | string     | null: false, unique: true        |
| password           | string     | null: false                      |
| password_confirm   | string     | null: false                      |
| record             | string     | null: false                      |

### Association

- has_one  : user_profile
- has_many : records
- has_many : items
- has_many : comments

### items

| Column             | Type       | Options                          |
| ------------------ | ---------- | -------------------------------- |
| item_image         | ---------- | Active_strageにて実装              |
| item_name          | text       | null: false                      |
| description        | text       | null: false                      |
| price              | integer    | null: false                      |
| user               | string     | null: false, foreign_key: true   |                     |

## Association

- belongs_to :user
- has_many : item_brands
- has_one: category
- has_one: status
- has_one: shipment
- has_one: source
- has_one: shipping_address

### items_brands

| Column             | Type       | Options                          |
| ------------------ | ---------- | -------------------------------- |
| item               | reference  | null: false, foreign_key: true   |
| brand              | reference  | null: false, foreign_key: true   |

## Association

- belongs_to :item
- belongs_to :brand

### brands

| Column             | Type       | Options                          |
| ------------------ | ---------- | -------------------------------- |
| brand_name         | text       | null: false, foreign_key: true   |

## Association
- has_many: item_brands

### categories

| Column             | Type       | Options                          |
| ------------------ | ---------- | -------------------------------- |
| item               | reference  | null: false, foreign_key: true   |
| brand              | reference  | null: false, foreign_key: true   |

## Association
- belongs_to :item

### categories

| Column             | Type       | Options                          |
| ------------------ | ---------- | -------------------------------- |
| item               | reference  | null: false, foreign_key: true   |
| brand              | reference  | null: false, foreign_key: true   |

## Association
- belongs_to :item

### statuses

| Column             | Type       | Options                          |
| ------------------ | ---------- | -------------------------------- |
| item_status        | string     | null: false                      |
| item               | reference  | null: false, foreign_key: true   |

## Association
- belongs_to :item

### source

| Column              | Type       | Options                          |
| ------------------  | ---------- | -------------------------------- |
| shipping_prefecture | string     | null: false                      |
| shipping_schedule   | string     | null: false                      |
| item                | reference  | null: false, foreign_key: true   |

## Association
- belongs_to :item

### records

| Column              | Type       | Options                          |
| ------------------  | ---------- | -------------------------------- |
| buyer_name          | string     | null: false                      |
| purchased_day       | integer    | null: false                      |
| user                | reference  | null: false, foreign_key: true   |
| item                | reference  | null: false, foreign_key: true   |

## Association
- belongs_to :user
- belongs_to :item
- has_one: shipping_address

### shipping_addresses

| Column              | Type       | Options                          |
| ------------------  | ---------- | -------------------------------- |
| postal_code         | integer    | null: false                      |
| prefecture          | string     | null: false                      |
| municipality        | string     | null: false                      |
| street_number       | string     | null: false                      |  
| building_name       | string     | null: false                      |
| telephone_number    | string     | null: false                      |
| record_id           | string     | null: false                      |
| purchased_day       | integer    | null: false                      |
| item                | reference  | null: false, foreign_key: true   |

- belongs_to :record


### comments

| Column              | Type       | Options                          |
| ------------------  | ---------- | -------------------------------- |
| text                | text       | null: false                      |
| user_id             | reference  | null: false, foreign_key: true                    |
| item_id             | reference  | null: false, foreign_key: true   |

## Association
- belongs_to :user
- belongs_to :item