# テーブル設計
## users テーブル

|Column    |Type    |Options        |
|----------|--------|---------------|
| name     | string | null: false   |
| email    | string | null: false   |
| password | string | unique: false |
### Association

has_many :goods
has_many :buys

## goods テーブル

|Column         |Type         |Options                        |
|---------------|-------------|-------------------------------|
| goods_name    | string      | null: false                   |
| explanation   | text        | null: false                   |
| category      | string      | null: false                   |
| status        | text        | null: false                   |
| delivery_fee  | integer     | null: false                   |
| area          | string      | null: false                   |
| days          | string      | null: false                   |
| price         | string      | null: false                   |
| seller        | string      | null: false                   |
| user          | references  | null: false,foreign_key: true |
### Association

belongs_to :users
belongs_to :buys

## buys テーブル

|Column         |Type         |Options                        |
|---------------|-------------|-------------------------------|
| buyer         | string      | null: false                   |
| user          | references  | null: false,foreign_key: true |
### Association

has_many :address
has_one  :goods

## address テーブル

|Column         |Type         |Options                       |
|---------------|-------------|------------------------------|
| postal        | string      | null: false                  |
| prefectures   | string      | null: false                  |
| municipality  | string      | null: false                  |
| house_number  | string      | null: false                  |
| phone_number  | integer     | null: false                  |
| buy           | references  | null: false,foreign_key: true|
### Association

belongs_to :buys