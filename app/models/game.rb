class Game < ApplicationRecord
	belogngs_to :genre
	belogngs_to :member
end
