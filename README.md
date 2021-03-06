# テーブル設計

## users テーブル

| Column               | Type    | Options     |
| -------------------- | ------- | ----------- |
| nickname             | string  | null: false |
| email                | string  | null: false |
| encrypted_password   | string  | null: false |
| last_name            | string  | null: false |
| first_name           | string  | null: false |
| last_name_kana       | string  | null: false |
| first_name_kana      | string  | null: false |
| birthday             | date    | null: false |

### Association

- has_many :items
- belongs_to :order
- has_one :delivery

## items テーブル

| Column              | Type          | Options                        |
| ------------------- |  ------------ | ------------------------------ |
| description_product | text          | null: false                    |
| category_id         | integer       | null: false                    |
| item_status_id      | integer       | null: false                    |
| delivery_burden_id  | integer       | null: false                    |
| delivery_area_id    | integer       | null: false                    |
| shipping_time_id    | integer       | null: false                    |
| seller_user_id      | references    | null: false                    |

### Association

- belongs_to :user
- has_one :oder


## orders テーブル

| Column          | Type        | Options                        |
| --------------- | ----------- | ------------------------------ |
| seller_user_id  | references  | null: false, foreign_key: true |
| buyer_user_id   | references  | null: false, foreign_key: true |

### Association

- has_many :users
- belongs_to :item


## deliveries テーブル

| Column          | Type        | Options                        |
| --------------- | ----------- | ------------------------------ |
| postcode        | string      | null: false                    |
| prefecture_id   | integer     | null: false                    |
| city            | string      | null: false                    |
| block           | string      | null: false                    |
| building        | string      |                                |
| phone_number    | string      | null: false                    |

### Association

- belongs_to :user