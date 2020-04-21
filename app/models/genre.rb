class Genre < ApplicationRecord
  has_many :games #ジャンル消してもゲームは消さないのでdestroyは無し

  validates :name, presence: true

end
