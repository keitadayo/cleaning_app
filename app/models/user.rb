class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  has_many :sns_credentials
  has_many :posts
  has_many :goods
  has_many :comments


  validates :nickname, presence: true
  mix_case = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i
  at_sign = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  chara_8_more = /.{8,}/


  with_options presence: true do
    validates :email, format: { with: at_sign, message: 'メールアドレスには@を入力してください' }
    validates :password, format: { with: chara_8_more, message: 'パスワードは8文字以上入力してください。' }
    validates :password, format: { with: mix_case, message: 'パスワードは英数字混合で入力してください。' }
  end

  def self.from_omniauth(auth)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
    user = User.where(email: auth.info.email).first_or_initialize(
      nickname: auth.info.name,
        email: auth.info.email
    )
    if user.persisted?
      sns.user = user
      sns.save
    end
    { user: user, sns: sns }
  end
end
