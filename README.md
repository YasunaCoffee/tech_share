Questionsテーブル
・質問内容
has_many :answers
belongs_to :curriculum 
Answersテーブル
・仮説検証
・アクションプラン
・参考記事、検索キーワード
belongs_to :question 
belongs_to :curriculum 
Curriculumsテーブル
・実装段階
・カリキュラムURL
has_many :questions 
has_many :answers
Commentsテーブル
・コメント、ツッコミ
Usersテーブル
・ニックネーム
・メールアドレス
・プロフ画像(いる？)
Imagesテーブル(activestorage)
