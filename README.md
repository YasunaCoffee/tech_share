## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, foreign_key: true, unique: true|
|email|string|null: false, foreign_key: true, unique: true|
|password|integer|null: false, foreign_key: true|

### Association
- has_many :groups, through: :members
- has_many :messages


## Questionsテーブル

|Column|Type|Options|
|------|----|-------|
|content|text|null: false|

### Association

has_many :answers
belongs_to :curriculum
belongs_to :user

## Answersテーブル

|Column|Type|Options|
|------|----|-------|
|theory|string|null: false|
|action|string|null: false|
|tip|string|null: false|
|question_id|integer|null: false, foreign_key: true|

### Association
- has_many :questions
- belongs_to :user
- has_many :comments

## curriculumsテーブル

|Column|Type|Options|
|------|----|-------|
|app|string|null: false|
|phase|string|null :false|
|url|string|null :false|

### Association
- has_many :questions

## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|comment|string|null :false|
|answer_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|


### Association
- belongs_to :answer
- belongs_to :user


