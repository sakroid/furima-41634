# README
# テーブル設計
## users
|Column            |Type  |Option                   |
|------------------|------|-------------------------|
|nickname          |string|null: false              |
|email             |string|null: false, unique: true|
|encrypted_password|string|null: false              |
|last_name         |string|null: false              |
|first_name        |string|null: false              |
|last_name_kana    |string|null: false              |
|first_name_kana   |string|null: false              |
|birth_date        |date  |null: false              |

### Assosiation
- has_many :items
- has_many :purchases

## items
|Column              |Type      |Option                        |
|--------------------|----------|------------------------------|
|name                |string    |null: false                   |
|info                |text      |null: false                   |
|category_id         |integer   |null: false                   |
|status_id           |integer   |null: false                   |
|fee_status_id       |integer   |null: false                   |
|prefecture_id       |integer   |null: false                   |
|schedule_delivery_id|integer   |null: false                   |
|price               |integer   |null: false                   |
|user                |references|null: false, foreign_key: true|

### Assosiation
- has_one :purchase
- belongs_to :user

## purchases
|Column           |Type      |Option                        |
|-----------------|----------|------------------------------|
|user             |references|null: false, foreign_key: true|
|item             |references|null: false, foreign_key: true|

### Assosiation
- belongs_to :item
- belongs_to :user
- has_one :shipping

## shippings
|Column           |Type      |Option                        |
|-----------------|----------|------------------------------|
|postal_coad      |string    |null: false                   |
|prefecture_id    |integer   |null: false                   |
|city             |string    |null: false                   |
|address          |string    |null: false                   |
|building         |string    |null: false                   |
|phone_number     |string    |null: false                   |
|purchase         |references|null: false, foreign_key: true|

### Assosiation
- belongs_to :purchase