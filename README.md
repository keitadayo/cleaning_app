# テーブル設計

## users テーブル
| Column          | Type     | Options     |
| --------------- | -------- | ----------- |
| nickname        | string   | null:false  |
| email           | string   | null:false  |
| password        | string   | null:false  |

### Association
- has_many :posts
- has_many :goods
- has_many :comments

## posts テーブル
| Column       | Type       | Options                      |
| ------------ | ---------- | ---------------------------- |
| title        | string     | null:false                   |
| text         | text       | null:false                   |

### Association
- has_many :comments
- has_many :post_tags
- has_many :goods
- belongs_to :user

## goods テーブル
| Column          | Type       | Options                      |
| --------------- | ---------- | ---------------------------- |
| post_id         | references | null:false, foreign_key:true |
| user_id         | references | null:false, foreign_key:true |

### Association
- belongs_to :user
- belongs_to :post

## comments テーブル
| Column      | Type       | Options                      |
| ----------- | ---------- | ---------------------------- |
| text        | text       | null:false                   |
| user_id     | references | null:false, foreign_key:true |
| post_id     | references | null:false, foreign_key:true |

### Association
- belongs_to :user
- belongs_to :post

## post_tags テーブル
| Column          | Type       | Options                      |
| --------------- | ---------- | ---------------------------- |
| post_id         | references | null:false, foreign_key:true |
| user_id         | references | null:false, foreign_key:true |

### Association
- belongs_to :post
- belongs_to :tag

## tags テーブル
| Column          | Type       | Options                      |
| --------------- | ---------- | ---------------------------- |
| post_id         | references | null:false, foreign_key:true |
| user_id         | references | null:false, foreign_key:true |

## Association
- has_many :post_tags