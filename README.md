# テーブル設計

## users  テーブル
| Column                  | Type   | options    |
| ----------------------- | ------ | ---------- |
| nickname                | string | null: false|
| email                   | string | null: false|
| encrypted_password      | string | null: false|
| first_name_kanji        | string | null: false|
| last_name_kanji         | string | null: false|
| first_name_kana         | string | null: false|
| last_name_kana          | string | null: false|
| birthday                | date   | null: false|


### Association

<!-- - has_many :comments -->
- has_many :items
- has_many :orders


## items テーブル
| Column             | Type      | Options                      |
| ------------------ | --------- | ---------------------------- |
| name               | string    | null: false                  |
| text               | text      | null: false                  |
| category_id        | integer   | null: false                  |
| status_id          | integer   | null: false                  |
| fee_id             | integer   | null: false                  |
| source_id          | integer   | null: false                  |
| shipping_id        | integer   | null: false                  |
| price              | integer   | null: false                  |
| user               | references| null:false  foreign_key: true|



### Association

<!-- - has_many :comments -->
- belongs_to :user
- has_one :buyer
- has_one :order




## order テーブル 
| Column              | Type       | Options                       |
| ------------------- | ---------- | ----------------------------- |
| postal_code         | string     | null: false                   |   
| source_id           | integer    | null: false                   |
| city                | string     | null: false                   |
| house_number        | string     | null: false                   |
| building_name       | string     |                               |
| phone_number        | string     | null: false                   |
| user_item           | references | null:false  foreign_key: true | 
| buyer               | references | null:false  foreign_key: true | 



<!-- | card_information    | integer| null: false|
| expiration_date     | integer| null: false|
<!-- | securit_code        | integer| null: false| --> 
 <!-- カード情報はセキリュティの関係上データベースに保存しない --> 
<!-- postal_code ハイフンを必要とすることもあるのでstring -->
<!-- 電話番号は数字の文字列として実装しておきたいためstring型で実装,数値型で実装すると、DB保存時に先頭の0が削除される -->

 ### Association

- belongs_to :buyer
- belongs_to :item




## buyer テーブル

| Column      | Type       | Options                       |
| ----------- | ---------- | ----------------------------- |
| item        | references | null:false  foreign_key: true |
| user        | references | null:false  foreign_key: true | 

 ### Association

- belongs_to :user
- belongs_to :item
- has_one :order




