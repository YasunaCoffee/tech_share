## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, unique: true|
|email|string|null: false, unique: true|
|password|integer|null: false|

### Association
- has_many :questions
- has_many :answers


## Questionsテーブル

|Column|Type|Options|
|------|----|-------|
|content|text|null: false|
|title|string|null: false|
|curriculum|integer|null: false|

### Association

has_many :answers
belongs_to :curriculum
belongs_to :user

## Answersテーブル

|Column|Type|Options|
|------|----|-------|
|content|text|null: false|
|question|references|null: false, foreign_key: true|

### Association
- has_many :questions
- belongs_to :user

## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|comment|string|null :false|
|article|references|null: false, foreign_key: true|
|user|references|null: false, foreign_key: true|

### Association
- belongs_to :article
- belongs_to :user

## Articlesテーブル
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|app|string|null:false|
|curriculum|string|null:false|
|content|text|null: fasle|

### Association
has_many: tags,through: :article_tags
belongs_to: user

## Article_tagsテーブル

|Column|Type|Options|
|------|----|-------|
|tag|references|null: false,foreign_key: true|
|article|references|null: false,foreign_key: true|

### Association
- belongs_to: article
- belongs_to: tag

## tagsテーブル(プログラミング言語など)

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many: articles, through: :article_tags


