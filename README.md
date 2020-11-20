# テーブル設計

## users  テーブル
| Column                  | Type   | options    |
| ----------------------- | ------ | ---------- |
| nickname                | string | null: false|
| email                   | string | null: false|
| password                | string | null: false|
| encrypted_password      | string | null: false|
| first_name(kanji)       | string | null: false|
| last_name(kanji)        | string | null: false|
| first_name(kana)        | string | null: false|
| last_name(kana)         | string | null: false|
| birthday                | date   | null: false|


### Association

<!-- - has_many :comments -->
- has_many :items
- has_one :buyer
- has_one :card


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
| user_id            | references| null:false  foreign_key: true|



### Association

<!-- - has_many :comments -->
- belongs_to :user
- has_one :buyer

<!-- 以下のコメント記述、おそらく必要はない -->
<!-- - has_one_attached :image -->

<!-- 必要ないかもしれないが一応作成
## image テーブル
| Column              | Type      | Options       |
| ------------------- | --------- | --------------|
| image               | string    | null: false   | 
| item_id             | integer   | null: false   |

### Association
belongs_to :item

 -->






## buyer テーブル 
| Column              | Type      | Options                      |
| ------------------- | --------- | ---------------------------- |
| postal_code         | string    | null: false                  |   
| source_id           | string    | null: false                  |
| municipality        | string    | null: false                  |
| address             | string    | null: false                  |
| building            | string    |                              |
| phone               | string    | null: false                  |
| user_id             | references| null:false  foreign_key: true|
| item_id             | references| null:false  foreign_key: true|


<!-- | card_information    | integer| null: false|
| expiration_date     | integer| null: false|
<!-- | securit_code        | integer| null: false| --> 
 <!-- カード情報はセキリュティの関係上データベースに保存しない --> 
<!-- postal_code ハイフンを必要とすることもあるのでstring -->
<!-- 電話番号は数字の文字列として実装しておきたいためstring型で実装,数値型で実装すると、DB保存時に先頭の0が削除される -->


 ### Association

- belongs_to :item
- belongs_to :user

## card テーブル

| Column      | Type       | Options                       |
| ----------- | ---------- | ----------------------------- |
| card_id     | string     | null:false                    |
| buyer_id    | references | null:false  foreign_key: true |
| user_id     | references | null:false  foreign_key: true |   

 ### Association

 - belongs_to :user





<!-- ## comments テーブル
| Column     | Type       | Options     |
| ---------- | ---------- | ----------- |
| text       | text       | null: false |
| user       | references |             |
| item       | references |             |

### Association

- belongs_to :user
- belongs_to :item -->