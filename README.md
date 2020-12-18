# テーブル設計
## users テーブル

|Column              |Type    |Options                    |
|--------------------|--------|---------------------------|
| nickname           | string | null: false               |
| email              | string | unique: true,null: false  |
| encrypted_password | string | null: false  　　　　　　　　|
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_katakana | string | null: false               |
| first_name_katakana| string | null: false               |
| birthday           | date   | null: false               |

### Association

has_many :goods
has_many :buys

## goods テーブル

|Column          |Type         |Options                        |
|----------------|-------------|-------------------------------|
| goods_name     | string      | null: false                   |
| explanation    | text        | null: false                   |
| category_id    | integer     | null: false                   |
| status_id      | integer     | null: false                   |
| delivery_fee_id| integer     | null: false                   |
| area_id        | integer     | null: false                   |
| days_id        | integer     | null: false                   |
| price          | integer     | null: false                   |
| user           | references  | null: false,foreign_key: true |
### Association

belongs_to :user
has_one :buy

## buys テーブル

|Column         |Type         |Options                        |
|---------------|-------------|-------------------------------|
| user          | references  | null: false,foreign_key: true |
| good          | references  | null: false,foreign_key: true |
### Association

has_one :address
belongs_to  :good
belongs_to :user

## address テーブル

|Column          |Type         |Options                       |
|----------------|-------------|------------------------------|
| postal         | string      | null: false                  |
| municipality   | string      | null: false                  |
| house_number   | string      | null: false                  |
| phone_number   | string      | null: false                  |
| building_number| string      |                              |
| buy            | references  | null: false,foreign_key: true|
| area_id        | integer     | null: false
### Association

belongs_to :buy