# テーブル設計

## users テーブル

| Column             | Type       | Options                        |
| -----------------  | ---------- | ------------------------------ | 
| nickname           | string     | null: false                    |
| email              | string     | null: false,uniqueness: true   |
| encrypted_password | string     | null: false                    |
| first_name         | string     | null: false                    |
| last_name          | string     | null: false                    |
| first_name_kana    | string     | null: false                    |
| last_name_kana     | string     | null: false                    |
| birthday           | date       | null: false                    |

### Association

- has_many :items
- has_many :purchases


## items テーブル

| Column               | Type        | Options                      |
| -------------------- | ----------  | ---------------------------- | 
| user                 | references  | null: false,foreign_key:true |
| name                 | string      | null: false                  |
| introduction         | text        | null: false                  |
| category_id          | integer     | null: false                  |
| status _id           | integer     | null: false                  |
| delivery_charge_id   | integer     | null: false                  |
| delivery_area_id     | integer     | null: false                  |
| delivery_day_id      | integer     | null: false                  |
| price                | integer     | null: false                  |

### Association

- belongs_to :user


## addressテーブル

| Column            | Type       | Options       |
| ----------------- | ---------- | ------------- |
| postal_code_id    | string     | null: false   |
| prefecture_id     | integer    | null: false   |
| city              | string     | null: false   |
| house_number      | string     | null: false   |
| building_name     | string     |               |
| phone_number      | string     |               |
|                   |            |               |
|                   |            |               |
|                   |            |               |

### Association

- belongs_to :purchase

## purchasesテーブル

 Column        | Type        | Options       |
| ------------ | ----------  | ------------- |
| user         | references  | null: false   |
| item         | references  | null: false   |

### Association

- belongs_to :user
- belongs_to :item
- belongs_to :address