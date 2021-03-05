# テーブル設計

## users テーブル

| Column          | Type    | Options     |
| --------------- | ------- | ----------- |
| nickname        | string  | null: false |
| email           | string  | null: false |
| password        | string  | null: false |
| last_name       | string  | null: false |
| first_name      | string  | null: false |
| last_name_kana  | string  | null: false |
| first_name_kana | string  | null: false |
| birthday        | integer | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column              | Type          | Options                        |
| ------------------- |  ------------ | ------------------------------ |
| description_product | text          | null: false                    |
| product_name        | string        | null: false                    |
| category            | string        | null: false                    |
| item_status         | string        | null: false                    |
| delivery_burden     | string        | null: false                    |
| delivery_area       | string        | null: false                    |
| shipping_time       | string        | null: false                    |
| price               | integer       | null: false                    |
| seller              | references    | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :oder

## orders テーブル

| Column          | Type        | Options                        |
| --------------- | ----------- | ------------------------------ |
| card_number     | integer     | null: false                    |
| expiration_date | integer     | null: false                    |
| security_code   | integer     | null: false                    |
| postcode        | integer     | null: false                    |
| prefectures     | string      | null: false                    |
| city            | string      | null: false                    |
| block           | string      | null: false                    |
| building        | string      | null: false, foreign_key: true |
| phone_number    | integer     | null: false, foreign_key: true |
| seller_id       | references  | null: false, foreign_key: true |
| buyer_id        | references  | null: false, foreign_key: true |
| price           | references  | null: false, foreign_key: true |
| product_name    | references  | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item