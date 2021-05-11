class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        # database_authenticatable（パスワードの正確性を検証）
        # registerable（ユーザ登録や編集、削除）
        # recoverable（パスワードをリセット）
        # rememberable（ログイン情報を保存）
        # validatable（emailのフォーマットなどのバリデーション）

  has_many :post_images, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  attachment :profile_image
  # attachmentには、カラム名（profile_image_id）から_idを除いた名前（profile_image）を記述します（3章参照）。

end
