class Model < ApplicationRecord
	has_many :game_models
	has_many :games, dependent: :destroy,through: :game_models

end
