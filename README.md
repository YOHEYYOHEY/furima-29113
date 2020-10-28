# テーブル設計

## users テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ | 
| user              | string     | null: false                    |
| email             | string     | null: false,uniqueness: true   |
| password          | string     | null: false                    |
| password_conform  | string     | null: false                    |
| first_name        | string     | null: false                    |
| last_name         | string     | null: false                    |
| first_name_kana   | string     | null: false                    |
| last_name_kana    | string     | null: false                    |
| birthday          | date       | null: false                    |

### Association

- has_many :items
- has_one :address
- has_one :cards


## items テーブル

| Column            | Type       | Options       |
| ----------------- | ---------- | ------------- | 
| item_image        | string     | null: false   |
| name              | string     | null: false   |
| introduction      | string     | null: false   |
| category          | string     | null: false   |
| status            | string     | null: false   |
| delivery_charge   | string     | null: false   |
| delivery_area     | string     | null: false   |
| delivery_day      | string     | null: false   |
| price             | integer    | null: false   |

### Association

- has_many :products
- belongs_to :user


## imagesテーブル

| Column            | Type       | Options       |
| ----------------- | ---------- | ------------- |
| image             | string     | null: false   |
| item              | reference  | null: false   |
|                   |            |               |

### Association

- belongs_to :items


## addressテーブル

| Column            | Type       | Options       |
| ----------------- | ---------- | ------------- |
| postal_code       | string     | null: false   |
| prefecture        | string     | null: false   |
| city              | string     | null: false   |
| house_number      | string     | null: false   |
| building_name     | string     | null: false   |
| phone_number      | string     | null: false   |
|                   |            |               |
|                   |            |               |
|                   |            |               |

### Association

- belongs_to :users

## cardsテーブル

| Column            | Type       | Options       |
| ----------------- | ---------- | ------------- | 
| card_number       | integer    | null: false   |
| card_year         | integer    | null: false   |
| card_month        | integer    | null: false   |
| card_id           | integer    | null: false   |
|                   |            |               |
|                   |            |               |
|                   |            |               |
|                   |            |               |
|                   |            |               |

### Association

- belongs_to :users