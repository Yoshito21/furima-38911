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
- has_many :purchase_histories

## items テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| item_name           | string     | null: false                    |
| item_explanation    | text       | null: false                    |
| categories_id       | integer    | null: false, foreign_key: true |
| conditions_id       | integer    | null: false, foreign_key: true |
| shipping_charges_id | integer    | null: false, foreign_key: true |
| prefectures_id      | integer    | null: false, foreign_key: true |
| days_to_ship_id     | integer    | null: false, foreign_key: true |
| item_price          | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase_history
- belongs_to :category
- belongs_to :condition
- belongs_to :shipping_charge
- belongs_to :prefecture
- belongs_to :days_to_ship

## purchase_histories テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- belongs_to :order


## orders テーブル

| Column         | Type    | Options                        |
| -------------- | ------- | ------------------------------ |
| post_code      | string  | null: false                    |
| prefectures_id | integer | null: false, foreign_key: true |
| municipalities | string  | null: false                    |
| address        | string  | null: false                    |
| building_name  | string  |                                |
| phone_number   | string  | null: false, unique: true      |

### Association

- has_many :purchase_history
- belongs_to :prefecture

## categories テーブル

| Column     | Type    | Options     |
| ---------- | ------- | ----------- |
| id         | integer | null: false |
| categories | string  | null: false |

### Association

- has_many :items

## conditions テーブル

| Column     | Type    | Options     |
| ---------- | ------- | ----------- |
| id         | integer | null: false |
| conditions | string  | null: false |

### Association

- has_many :items

## shipping_charges テーブル

| Column           | Type    | Options     |
| ---------------- | ------- | ----------- |
| id               | integer | null: false |
| shipping_charges | string  | null: false |

### Association

- has_many :items

## prefectures テーブル

| Column      | Type    | Options     |
| ----------- | ------- | ----------- |
| id          | integer | null: false |
| prefectures | string  | null: false |

### Association

- has_many :items
- has_many :orders

## days_to_ship テーブル

| Column       | Type    | Options     |
| ------------ | ------- | ----------- |
| id           | integer | null: false |
| days_to_ship | string  | null: false |

### Association

- has_many :items