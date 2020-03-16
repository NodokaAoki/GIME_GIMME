class Game < ApplicationRecord
	belongs_to :genre
	belongs_to :member

	has_many :playtimes, dependent: :destroy
	accepts_nested_attributes_for :playtimes

	has_many :game_models
	has_many :models, dependent: :destroy,through: :game_models
	has_many :comments, dependent: :destroy
	has_many :favorites, dependent: :destroy
	has_many :game_reports, dependent: :destroy

	enum cero_rating:{"A(全年齢)": 0,"B(12歳以上)": 1,"C(15歳以上)": 2,"D(17歳以上)": 3,"Z(18歳以上)": 4}

	# プレイ時間の追加済みか
	def playtime_by?(member)
		playtimes.where(member_id: member.id).exists?
	end
	# お気に入り済みか
	def favorite_by?(member)
		favorites.where(member_id: member.id).exists?
	end
end
