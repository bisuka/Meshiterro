class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

		# :database_authenticatable（パスワードの正確性を検証）
		# :registerable（ユーザ登録や編集、削除）
		# :recoverable（パスワードをリセット）
		# :rememberable（ログイン情報を保存）
		# :validatable（emailのフォーマットなどのバリデーション）
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # UserモデルにPostImageモデルを関連付け.複数形
  has_many :post_images, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  attachment :profile_image

end
