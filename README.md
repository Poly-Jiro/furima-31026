# テーブル設計

## users テーブル

| Column             | Type       | Options                          |
| ------------------ | ---------- | -------------------------------- |
| nickname           | string     | null: false, unique: true        |
| email              | string     | null: false, unique: true        |
| encrypted_password | string     | null: false                      |
| family_name        | string     | null: false                      |
| family_name_kana   | string     | null: false                      |
| first_name         | string     | null: false                      |
| first_name_kana    | string     | null: false                      |
| birthday           | date       | null: false                      |

### Association

- has_many :records
- has_many :items
- has_many :comments

### items

| Column             | Type       | Options                          |
| ------------------ | ---------- | -------------------------------- |
| name               | string     | null: false                      |
| description        | text       | null: false                      |
| price              | integer    | null: false                      |
| user               | references | null: false, foreign_key: true   |        
| status_id          | integer    | null:false                       |
| fee_id             | integer    | null:false                       |
| source_id          | integer    | null:false                       |
| schedule_id        | integer    | null:false                       |
| category_id        | integer    | null:false                       |

## Association

- belongs_to :user
- has_many   :comments
- has_one    :record

### records

| Column              | Type       | Options                          |
| ------------------  | ---------- | -------------------------------- |
| user                | references | null: false, foreign_key: true   |
| item                | references | null: false, foreign_key: true   |

## Association
- belongs_to :user
- belongs_to :item
- has_one: shipping_address

### shipping_addresses

| Column              | Type       | Options                          |
| ------------------  | ---------- | -------------------------------- |
| postal_code         | string     | null: false                      |
| prefecture_id       | integer    | null: false                      |
| municipality        | string     | null: false                      |
| street_number       | string     | null: false                      |  
| building_name       | string     |                                  |
| telephone_number    | string     | null: false                      |
| record              | references | null: false, foreign_key: true   |

## Association
- belongs_to :record

### comments

| Column              | Type       | Options                          |
| ------------------  | ---------- | -------------------------------- |
| text                | text       | null: false                      |
| user                | references | null: false, foreign_key: true   |
| item                | references | null: false, foreign_key: true   |

## Association
- belongs_to :user
- belongs_to :item