class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum status: {有効: 0, 退会: 1,停止: 2}

	has_many :games #会員を消してもゲームは消さないのでdestroyは無し
	has_many :playtimes
end
