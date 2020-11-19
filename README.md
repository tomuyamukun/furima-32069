# テーブル設計

## users  テーブル
| Column                  | Type   | options    |
| ----------------------- | ------ | ---------- |
| nickname                | string | null: false|
| email                   | string | null: false|
| password                | string | null: false|
| password_confimation    | text   | null: false|
| name(kanji)             | text   | null: false|
| name(kana)              | text   | null: false|
| birthday                | integer| null: false|


### Association

<!-- - has_many :comments -->
- has_many :items


## items テーブル
| Column             | Type      | Options         |
| ------------------ | --------- | --------------- |
| item_name          | string    | null: false     |
| item_text          | text      | null: false     |
| category           | string    | null: false     |
| status             | string    | null: false     |
| fee                | integer   | null: false     |
| source             | string    | null: false     |
| shipping           | integer   | null: false     |
| price              | integer   | null: false     |

### Association

<!-- - has_many :comments -->
- belongs_to :user
- has_one :buyer


## buyer テーブル 
| Column              | Type   | Options    |
| ------------------- | ------ | ---------- |
| card_information    | integer| null: false|
| expiration_date     | integer| null: false|
| securit_code        | integer| null: false|
| postal_code         | integer| null: false|
| prefecture          | string | null: false|
| municipality        | string | null: false|
| address             | string | null: false|
| building            | string |            |
| phone               | integer| null: false|


### Association

- belongs_to :item














<!-- ## comments テーブル
| Column     | Type       | Options     |
| ---------- | ---------- | ----------- |
| text       | text       | null: false |
| user       | references |             |
| item       | references |             |

### Association

- belongs_to :user
- belongs_to :item -->