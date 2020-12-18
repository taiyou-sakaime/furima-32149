# テーブル設計
## users テーブル

|Column              |Type    |Options        |
|--------------------|--------|---------------|
| nickname           | string | null: false   |
| email              | string | null: false   |
| encrypted_password | string | unique: false |
| last_name          | string | null: false   |
| first_name         | string | null: false   |
| last_name_katakana | string | null: false   |
| first_name_katakana| string | null: false   |
| birthday           | integer| null: false   |

### Association

has_many :goods
has_many :buys

## goods テーブル

|Column         |Type         |Options                        |
|---------------|-------------|-------------------------------|
| goods_name    | string      | null: false                   |
| explanation   | text        | null: false                   |
| category      | integer     | null: false                   |
| status        | integer     | null: false                   |
| delivery_fee  | integer     | null: false                   |
| area          | integer     | null: false                   |
| days          | integer     | null: false                   |
| price         | string      | null: false                   |
| user          | references  | null: false,foreign_key: true |
### Association

belongs_to :user
belongs_to :buy

## buys テーブル

|Column         |Type         |Options                        |
|---------------|-------------|-------------------------------|
| buyer         | string      | null: false                   |
| user          | references  | null: false,foreign_key: true |
| good          | references  | null: false,foreign_key: true |
### Association

has_one :address
has_one  :goods

## address テーブル

|Column          |Type         |Options                       |
|----------------|-------------|------------------------------|
| postal         | string      | null: false                  |
| prefectures    | integer     | null: false                  |
| municipality   | string      | null: false                  |
| house_number   | string      | null: false                  |
| phone_number   | string      | null: false                  |
| building_number| string      | null: false                  |
| buy            | references  | null: false,foreign_key: true|
### Association

belongs_to :buys