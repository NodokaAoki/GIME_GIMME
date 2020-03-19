class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum status: {有効: 0, 退会: 1,停止: 2}

	has_many :games #会員を消してもゲームは消さないのでdestroyは無し
	has_many :playtimes #同上
	has_many :comments, dependent: :destroy #コメントは消す
	has_many :favorites, dependent: :destroy #同上
  has_many :warning_mails, dependent: :destroy #同上
end
