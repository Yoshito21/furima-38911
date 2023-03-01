# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| family_name        | string | null: false               |
| first_name         | string | null: false               |
| kana_family_name   | string | null: false               |
| kana_first_name    | string | null: false               |
| birthday           | date   | null: false               |

### Association

- has_many :items
- has_many :orders
- has_one :card

## items テーブル

| Column           | Type       | Options           |
| ---------------- | ---------- | ----------------- |
| item_name        | string     | null: false       |
| item_explanation | text       | null: false       |
| item_category    | string     | null: false       |
| item_condition   | string     | null: false       |
| shipping_charges | string     | null: false       |
| origin_region    | string     | null: false       |
| days_to_ship     | string     | null: false       |
| item_price       | integer    | null: false       |
| user             | references | foreign_key: true |

### Association

- belongs_to :user
- has_one :order

## order テーブル

| Column         | Type       | Options                   |
| -------------- | ---------- | ------------------------- |
| post_code      | integer    | null: false               |
| prefectures    | string     | null: false               |
| municipalities | string     | null: false               |
| address        | integer    | null: false               |
| building_name  | string     |                           |
| phone_number   | integer    | null: false, unique: true |
| user           | references | foreign_key: true         |
| item           | references | foreign_key: true         |

### Association

- belongs_to :user
- belongs_to :item

## cards テーブル

| Column      | Type       | Options                   |
| ----------- | ---------- | ------------------------- |
| token_id    | string     | null: false, unique: true |
| user        | references | foreign_key: true         |

### Association

- belongs_to :user
