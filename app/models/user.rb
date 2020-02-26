class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]
  # association
  has_many :answers
  has_many :answer_comments
  has_many :articles
  has_many :article_comments
  has_many :questions
  has_many :sns_credentials

  # method
  def self.from_omniauth(auth)
    # SnsCredentialから検索条件に合致するレコードが存在する場合にはそのレコードを参照しなければ保存する。
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_initialize
    # passwordの入力を不要にするためパスワードにランダムな値を代入する。
    password = Devise.friendly_token
    # sns認証を実施済みであれば、アソシエーションで取得する。なければemailでユーザーを検索してfirst_or_createで保存する。
    user = sns.user || User.where(email: auth.info.email).first_or_create(nickname: auth.info.name, password: password, password_confirmation: password)
    # 登録済みのuserはそのままログイン処理に移行し、Snscredentialのuser_idを更新する。
    if sns.user.blank?
      sns.user = user
      sns.save
    end
    user
  end
  
end
